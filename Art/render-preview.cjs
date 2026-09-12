const fs=require('fs'),path=require('path');
const {chromium}=require('C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/playwright');
process.chdir(path.join(__dirname,'..'));
(async()=>{
const palette=JSON.parse(fs.readFileSync('Art/preview-palette.json','utf8').replace(/^\uFEFF/,''));
const xml=fs.readFileSync('Mod/About/About.xml','utf8');
const versions=[...xml.match(/<supportedVersions>([\s\S]*?)<\/supportedVersions>/)[1].matchAll(/<li>(\d+(?:\.\d+)+)<\/li>/g)].map(m=>m[1]);
versions.sort((a,b)=>{const x=a.split('.').map(Number),y=b.split('.').map(Number);for(let i=0;i<Math.max(x.length,y.length);i++){if((x[i]||0)!==(y[i]||0))return (x[i]||0)-(y[i]||0);}return 0;});
if(!versions.length)throw Error('No stable supported version');const version=versions.at(-1);
const rgb=palette.veil.match(/\w\w/g).map(h=>parseInt(h,16)).join(',');
const vars=Object.entries(palette).map(([k,v])=>`--${k}:${v}`).join(';');
const html=`<!doctype html><meta charset="utf-8"><style>
:root{${vars}}*{margin:0;padding:0;box-sizing:border-box}
html,body{width:896px;height:504px;overflow:hidden;font-family:"Segoe UI",system-ui,sans-serif}
body{background:url(Preview.png) center/cover}
.veil{position:absolute;inset:0;background:radial-gradient(circle at 0% 0%,rgba(${rgb},.86) 0%,rgba(${rgb},0) 74%)}
.copy{position:absolute;left:50px;top:54px;color:var(--inkPrimary);text-shadow:0 3px 10px rgba(0,0,0,.75)}
h1{font-size:46px;font-weight:600;line-height:1.1;letter-spacing:0}
.suffix{font-size:.65em;color:var(--inkSecondary)}
.tag{font-size:24px;font-weight:400;line-height:1.1;letter-spacing:.2px;margin-top:8px;color:var(--inkSecondary)}
.rule{width:58px;height:3px;background:var(--accent);margin:20px 0 16px}
p{font-size:21px;font-weight:400;line-height:1.45;width:430px;letter-spacing:0;color:var(--inkPrimary)}
.badge{position:absolute;right:0;top:0;width:80px;height:80px;background:var(--accent);clip-path:polygon(0 0,100% 0,100% 100%)}
.version{position:absolute;left:869px;top:27px;transform:translate(-50%,-50%) rotate(45deg);font-size:26px;font-weight:700;line-height:1;color:var(--badgeInk)}
</style><div class="veil"></div><div class="copy"><h1><span class="title-main">Alpha Mythology</span><br><span class="suffix">Renew</span></h1><div class="tag">(unofficial)</div><div class="rule"></div><p>Mythological creatures<br>for your RimWorld colony.</p></div><div class="badge"></div><div class="version">${version}</div>`;
fs.writeFileSync('Art/Preview-layout.html',html);
const browser=await chromium.launch({executablePath:'C:/Program Files/Google/Chrome/Application/chrome.exe',headless:true});
const page=await browser.newPage({viewport:{width:896,height:504},deviceScaleFactor:1});
await page.goto(require('url').pathToFileURL(path.resolve('Art/Preview-layout.html')).href);await page.evaluate(()=>document.fonts.ready);
const cdp=await page.context().newCDPSession(page);await cdp.send('DOM.enable');await cdp.send('CSS.enable');const {root}=await cdp.send('DOM.getDocument');
const qa={version,paletteSource:'Art/preview-palette.json',elements:{}};
for(const selector of ['.title-main','.suffix','.tag','p','.version']){
const {nodeId}=await cdp.send('DOM.querySelector',{nodeId:root.nodeId,selector});const fonts=await cdp.send('CSS.getPlatformFontsForNode',{nodeId});
qa.elements[selector]={bounds:await page.locator(selector).boundingBox(),fonts:fonts.fonts};console.log(selector,JSON.stringify(fonts.fonts));if(fonts.fonts.some(f=>!f.familyName.startsWith('Segoe UI')))throw Error('Unexpected fallback font');}
await page.screenshot({path:'Mod/About/Preview.png'});
await page.addStyleTag({content:'h1,.tag,p,.version{visibility:hidden}'});await page.screenshot({path:'Art/Preview-background-qa.png'});
fs.writeFileSync('Art/Preview-qa.json',JSON.stringify(qa,null,2));await browser.close();
})();
