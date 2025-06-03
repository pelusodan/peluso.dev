'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "beaa3b72f81822b44b40857ce654a89c",
"assets/AssetManifest.bin.json": "defbe1be96bb4f90f4e593b945c4f5bd",
"assets/AssetManifest.json": "2607e15327bfdafc9ef5be73839e314b",
"assets/assets/doc/resume.pdf": "d7ca76e2a9c981818571c7cca95f5e9e",
"assets/assets/img/austin.png": "2ecff97773815a007356592c969366ff",
"assets/assets/img/cv.png": "18348f12ec692e597e27601be0b86113",
"assets/assets/img/daffy.gif": "551d8cff4dbb14ae2976eae6462022cc",
"assets/assets/img/devfest_yyc.jpg": "58ebe1f3f465523561246294df6fd632",
"assets/assets/img/droidcon.jpg": "b1d0d56aa987eedb9d0387f55808b70a",
"assets/assets/img/droidcon2.jpg": "00bc1e9dea215c701f664c02c342cd44",
"assets/assets/img/droidcon3.jpg": "89fb32d66794b9f97ba7e8e6cebf4519",
"assets/assets/img/feed.png": "706bbd52b1b3b6b9b9a73b35780ac5ac",
"assets/assets/img/flutterWeb.jpg": "7efb97550c50d5cffcd5401c0480ee01",
"assets/assets/img/fridgePal.png": "f7715c9bbe5aae9747d94752fd301243",
"assets/assets/img/header_dan.png": "0596c3d9ae4af8f871d50004a29f1299",
"assets/assets/img/kanestheticLearning.png": "5c049187833fa5b7b6437edb5eb66cf0",
"assets/assets/img/klaviyo.png": "00875adf7c7db8006a49bcb142a44f1b",
"assets/assets/img/mature.png": "3e4c0112544beea2d9654c56efb4794b",
"assets/assets/img/missMyTrain.png": "142af3bf5e8ce703631ef15248670207",
"assets/assets/img/neu.png": "85015b0ab8a2568af74eff58f40903db",
"assets/assets/img/old_school_profile.jpg": "8deda284f1742bfbd34cec7a63af3efa",
"assets/assets/img/peloton.png": "259e6c6e2aa96b2b9b653edf58f3019c",
"assets/assets/img/pison.png": "45d31c0160c00529d8f238800baf215a",
"assets/assets/img/pokemon.png": "d32e3559e0aad95146bdeeba360d951e",
"assets/assets/img/spider_water.jpg": "fc50d579815ff372ff0f2f68bb4e0ca2",
"assets/assets/img/walletGuru.png": "60e0e5ee8e965fddc9a4492c62c61a82",
"assets/assets/img/wallet_guru.png": "60e0e5ee8e965fddc9a4492c62c61a82",
"assets/assets/img/whoop.png": "4e1c0e66e04f276408ddd413015a9d48",
"assets/FontManifest.json": "875104f8b67c4340996c4b6b47b72223",
"assets/fonts/Blockstepped.ttf": "894bfc18e8fd1529415d43a891d78b31",
"assets/fonts/MaterialIcons-Regular.otf": "769c14b8a171522b74c73ddb22f0c6b2",
"assets/NOTICES": "c0265d80fe9491dfee35e8167ce31776",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter95/icons/checkmark.png": "4b40069f94e7be0c9ae7e79bd5d4eaa6",
"assets/packages/flutter95/icons/checkmark_disabled.png": "6791fa75b2d3b8402e476d7afb709b7d",
"assets/packages/flutter95/icons/icon_error.png": "19c2cb293b0cd882f62109b585d5e1b4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "c6ac80bdc5b2896345377c9439f91d54",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2f141ffd94f3ef0ed716615fd537e708",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "0ebc4e7ca5e040da671730a59b181135",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "9804f22f1abd1df645e7193d38703efb",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "2b0324f18d11ef70087f08dbee37a903",
"icons/Icon-192.png": "4f9b365bbbd340fb61c3d5ac83e9da2b",
"icons/Icon-512.png": "ba558d499f7ce5a27425b397af12d2cd",
"icons/Icon-maskable-192.png": "d59175c3b0e807c36020dfb727407511",
"icons/Icon-maskable-512.png": "9804f22f1abd1df645e7193d38703efb",
"index.html": "bcdcee56e992d3db279608eca902aea8",
"/": "bcdcee56e992d3db279608eca902aea8",
"main.dart.js": "afddaf33cb08b28c0bae3002a18fc5ea",
"manifest.json": "b140fcd94c3bde89d88baedb38b71212",
"version.json": "5ad5c2e689e6f120d1fc276dfc03bbcc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
