Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480539;
	b=dWmAgI1K10WhAtRMcQpN5OiZPQXsNb8hde5u88Sl/TsUPdCIplBVOJdCBPVhsWe0eDMw
	 TrPopdBlJlVggCq0LJIHrdIPaZwQRn1RuCBTuEJ4sFkiVa7u3dDMPZ2oHBBvm4h5hCsGM
	 a8cRkLBVGFzyw6llCIYMMCdKsq6GEIhwJ79Fr9MZukEzOjh/DelQxXZL9d16jiJcRz+bf
	 PjL+BaLDRw/2Z1CyyT92V44UfHQnI0+mAt8rrcEhVTHcZMMpZFC2lJEg15fnq18CzoUTu
	 y5czAFHa1t4vgQ1cs5LHMC3t1FnOrRB2901ixw/nhIvJ7w4ifsuI95O2nhuncXlHE2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
	b=aATfTqKEp/2X+oGmtPbvf0KfdUTeP2HxraI6UyT0l02nHdQ3hTJa0ySNddQECNbfnpNK
	 akdNJVHNS1c0FHIHChpZ8K+wHkpH43OUDT1vDm4NiS0RGCHd+vF+E6DN9HmLDQDgnUBEz
	 Bpx7gweeIVd05qjQ/Vq0ebiqDi0pDwqYG6cLFX60T+NssCRrrxiimNzmUZVnQIsKON5zo
	 cDuDHm8DxBjWK/hxOvB70oS++2k+KRRRoTN+A9tbHRcjqzjjehAcGDr4grwQt9M8rSR47
	 j59Y4g+1GjgD267OyFZSjy+e3QAAj2mv6h5jGsTZGiLm/z8g85magVjfmvCqcCV+OpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ANJWtQn0;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEC9606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDEC9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ANJWtQn0
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1481129b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480538; x=1796085338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
        b=ANJWtQn07idnhIuzVfW3nPlfg6xJ5aMg8KP5bLevx3ryF2EWMf5Y2C2WnH6ulnyDwL
         eyV0Rx92s0RCZMZDUL2ElO3Uo4+YC/BngcH6FawYWA+xrCOfKO9bKLQ9mOYbWuLJdHpf
         HRKvwqw581M4r2LNr72lq0FbnDg2OG/qqKnD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480538; x=1796085338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEtlzbFffNbXEfnRfrfQt3jwhoK6waIbjHPV7EqbNas=;
        b=sxwf18YueNEwI7/oFypbGzlbr/M6vv8ENRM6V8/2Nrc/s9GcXHo+8gspgQyg/92eIy
         H1DXlQUubxOCNimS7gFUQPIWwd3hB6kvlSqmk+aTry8tUywOKPdZP9XKVAb5tcK3uLWU
         2jEIMa7jrpihDGlahcY79aT1v+cdTRp6i/DJsk3dhxL7mOgWxtzG8ekIMXJE4qXMIlxp
         MhSeZCA1MX5tkjFIywK9p6mDLZrSAXvqvzQ9vJ8aZZ/oHXX3W0hWxdSPuyTz15RMsLa1
         yPtd9WUQM3qSfR/Cqn7zHOl5JlHhODlMnjvxf0ntLmtIHzgomk4rhtJ0JvlACzrq9V6h
         3fBA==
X-Forwarded-Encrypted: i=1; AL+hErEcImlT21cT8dr0TtLnpWe0GlhEAT9iNtI9VnE36EfXhTMKBzMPrUfx5jqUXxZB52pPf5p94GBd61Nc7G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+YJzzqrP8pZQThhL8z8wldWM9d4H23OlxDaeimzkGmUjMd9mX
	fpko6Wute+skJ0gg1N3pCEu+UYLFqUtKfaArargkIEqC9KzuxTu2olcwua8TM+sxtew=
X-Gm-Gg: AZFdTZeLGuGUTYjDh53w8nyegdtq8pTAa/okhDcMW5cZMUIC9Ev8jJwre2SpMT7XTHR
	wY1UW/bZWUbHxJY+EkU9BEgxnkHgENGseC07q0kb/VjSU8SYUcf2naBFqH2aN8141+ftviUlZXk
	gJ/4I4yUfO1jYosJytygtCl9mcaoT+o9oIHAmlsRMDmoL+5JSzW1mYT/KBlNATAQwx6/v7w+42o
	l6R8uUo2sEXRdAdOsKHwIArlLFw0UWMJSepBc5mcxzuD8bN5cGzUI1CcLAn1p/GYnmng3fdodrD
	Ng42pPBAUVNUIUDRrI3RwiUuckQXKYuKGv1JOuDtmw660PnLU5fGf0QWNooH4Q3fp7XKojqyd+U
	ZNlDyJGZ7BU2pPimUEN599RVErlVgxxXN6SozcB6KAFKRXhVBYT4mK5X7QzTNKtZ/w93K3adagW
	rk92VaNgcnRjuAU+Klm+ni3hO34JmuTfQBMiNAwOZRRf/pe/6tF14PppIZZEzquYTSDY0G6FJ28
	MZA2BsiiFlPBIh8Gxqx+hRCF/4gkps48J/x5oWapPsw1Yjb4YykFW1zmf5oAZX8fDf14QB+vDG6
	ZQEgZOIzC4Wl4EYyzzPbrkIzWoeocHwBmBtUF4SCBojwO4zA3vItj+aOBy+ccSr6yruWLsH9WEA
	D+BGSYCBrhBlbdMqF+gkTrUHA6Pll7hWKTk5MtYdCT7QzmVyyRZNINLbJBukT/2gC
X-Received: by 2002:a05:6a21:9188:b0:3eb:abb7:f92c with SMTP id adf61e73a8af0-4014cb3eed2mr11300988637.22.1795480538338;
        Mon, 23 Nov 2026 16:35:38 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:37 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Tue, 24 Nov 2026 06:05:25 +0530
Message-Id: <20261124003526.78471-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124003526.78471-1-piyus@iiitd.ac.in>
References: <20261124003526.78471-1-piyus@iiitd.ac.in>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ieee80211_mesh_build_beacon() budgets the user's extra IE blob once:

	tail_len = ... +
		   ifmsh->ie_len;

	bcn = kzalloc(sizeof(*bcn) + head_len + tail_len, GFP_KERNEL);

but two of the builders that fill the tail draw from that blob.
mesh_add_vendor_ies() emits everything from the first vendor IE to the
end of it:

	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;
		data = ifmsh->ie + offset;
		...
		skb_put_data(skb, data, len);

while mesh_add_rsn_ie() searches the whole blob:

	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);

A blob that begins with a vendor IE therefore has its RSN IE emitted
twice - once inside the verbatim vendor range, once on its own - and the
tail copy runs past the allocation:

  BUG: KASAN: slab-out-of-bounds in ieee80211_mesh_build_beacon+0xe3f
  Write of size 479 at addr ffff88805ca1887b by task syz-executor
   __asan_memcpy
   ieee80211_mesh_build_beacon          net/mac80211/mesh.c:1110
   ieee80211_start_mesh                 net/mac80211/mesh.c:1187
   ieee80211_join_mesh                  net/mac80211/cfg.c:3330
   rdev_join_mesh
   __cfg80211_join_mesh                 net/wireless/mesh.c:214
   nl80211_join_mesh                    net/wireless/nl80211.c:15399

One NL80211_CMD_JOIN_MESH carrying such an NL80211_ATTR_IE is enough.

Confine the RSN search to the non-vendor part of the blob, so the two
builders cover disjoint ranges and their total cannot exceed the single
ifmsh->ie_len the beacon was sized with.  The blob reaches us having passed
validate_ie_attr(), which walks the element chain and requires it to end
exactly at the end of the attribute, so the split returns an element
boundary that is not past ifmsh->ie_len.

An RSN IE placed behind a vendor IE is still emitted, as part of that
verbatim vendor range; nothing that a well-formed configuration sends is
dropped.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was checked by hand against the code, the fault was reproduced on
net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary secure-mesh beacons unaffected.

Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Cc: stable@vger.kernel.org
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/mac80211/mesh.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 8f8814125375..eb54bd98f282 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -379,12 +379,19 @@ int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
 	u8 len = 0;
 	const u8 *data;
+	size_t prefix;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
 		return 0;
 
-	/* find RSN IE */
-	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, ifmsh->ie_len);
+	/* Find the RSN IE in the non-vendor part of the blob only.  Everything
+	 * from the first vendor IE onwards is emitted verbatim by
+	 * mesh_add_vendor_ies(), and ieee80211_mesh_build_beacon() budgets
+	 * ifmsh->ie_len once for both of them, so an RSN IE sitting behind a
+	 * vendor IE would be copied twice and overrun the beacon's tail.
+	 */
+	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
+	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);
 	if (!data)
 		return 0;
 
-- 
2.34.1

