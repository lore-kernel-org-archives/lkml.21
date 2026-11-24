Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480542;
	b=jpckVG28mhj4IHLTdjGADUSGLvPGlcyGU6eKT8xPR1Hg3afjhsWq+2B1XGTp4zUJcKXs
	 chiXJavGCjqmPHJjsnVC6ws1m45A9cwwPSpzxIIlwuEfw/vwj9Q4hbJ3nMdxA1RGYBaxo
	 M8Xgvu8oCEaegMiI8Wrk5tbuOOR05VgB1lnjEljHqmQtUiptWMDNSR56ZrDqo+Y/D8g/p
	 Nlic3492N031GxfV8WRr8uTHXkCv/NKfIwt+33qkIRM/jk1qRa5FT2l1Xs6e4o1U3nETB
	 mIdTIodA6vubu8xf9hVxW3KqCWaL9iVL/cs5gD/rA8ZEaIX9HWBKlfJU6PKa9zTVqRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
	b=BdvHFXHG8oYT5RBeUoUZ3+Eh/t70uTUW2+nALTITgEnmbHwKNOT+zTV9emRmjxZQ6k56
	 DUFp6MNVDiL8PDZYKWrNBTQXPjG885TRfufQtp9blAdpc70X1HjBR3ddtIqaZaYmAtQ/H
	 oH/PJTDPt8WSg6BjlAs5zemMGoR3UWNocMRedcO508n3Re12RGdfHqqshvj7frT0CpAaQ
	 3aYyIFqRjENg6DB9LGD8l5m3pegMNiLcMobOHL5bsYuKxlwVYuGW14TQz1J8/S+Wbvk02
	 j/JW2JrZEf46Q6awwVNPz9WIvYnLuwF7BTO5ohnglNtrmWl0Kv4TfW8WgUNa10hPVhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=U89QZLLb;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51B606A337
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF51B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=U89QZLLb
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03920c477so33565825ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480541; x=1796085341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
        b=U89QZLLbOz59aD8Y5kR/XtX6j38G64zNPVUntrHhIUGN0iHKJN2mNev+3NSQqxsp/Y
         +zUNVxrmOYZhlvM+nck4tWMaOuqSxIHMFEOBgGfkiUGqVoaw36zfbAIS0G9/zL7tBQwK
         gg0A7xIINvpe6nGUVtF/FxRZNhm6iAL4DF0sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480541; x=1796085341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
        b=F+cSiCer0+6SJjfLPAsBwD+89eASRJM2+vLVtK/TmxmlNieGTfxKU3jQVvfsn7WSax
         dWivmxZqadRy8cRwEy24s5uDxqMwMn8l0IyW+XadYGuCCq/fySSj5Rvv7+pKIv3spYTu
         VRUny4jj2xJPIA3XxK/ZAK+AsUfT5ZHfU7kVUoxK1nE4ZbqPY6EeO6LMDb2Ri+ANvm6D
         osfgCj9ldUMLam2g8HcRx5+BCsaRkwa2Kvapo+5QtUgtKKeKr+KrpFdCcYrgUbpH5DHM
         Jw+xaqSRWzurnMMLnf3JmTACVpZS8lvjNbcuGI9PCpcMEpxJFtMGzzVZtfu39PU44MOH
         o04g==
X-Forwarded-Encrypted: i=1; AL+hErEBftpUY1RORCa81sdGwG1gQrugI9vlnzU0FkxAf+voggn8aZiMAn2NAU2dQm5f8H6rksPi7iH1cX9YdRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CDscCqyKzmJcwCqxGd+v5A4DH1POb/fGLILYPw4eagYzw5MUz
	L0uImYckBf1rdVDIOckWBz8wNtY49u2QH5RdoaPc4lpU8BBomr57V/0+pu4w/h0dXMM=
X-Gm-Gg: AZFdTZdXcghG38VkDEAYIU92vc28Me7f2SwaCboFT8IEx/MBW2OJ+hMyNx2izES0XC0
	k263PM3VHOUdR1YEheYdT8UstG0qBrzZIql8rMIMrd0DLzp+n4uNBPEeriRZNOhDgRPqVk8kDIa
	AinyXLMTWsJWTD2DAJTEjnUpnUBk3jZCrkzIAGmZ4yvmu/VOP4GAT4wcSJj7ryHBFYEnYJNRhKp
	+8lFUWsHF7Ya7rUIxqn1bJSC60CsQVCsJJ66kvSObvZD/SAqY7cvTQXM7NVhrcfZNmCDxaoTWwI
	YTjAIRwh9T4rEL/BJOaEfbYJ5EMEKpqXkbNf9kR7qUBD82A44aVKqdVFIc1/0ZmvdKpAV/r2vuS
	DKfdfMD2cavd3irmG6jEXYCxXGaaEvF54v7qnU9armnKDUq1xaZQw/Yd/EXNlgFas9EFFybjmlE
	ibYg8pAXPBJZoTg/zvQd+VeuFmhxQDT1HFQjPSpbU9GGCBwM+/3m66CpZw5dzxj/ULuC7Ne0lDS
	iE4SLfOSAfMpHhCOKRWuTjc1oEWKpBlHoAYMFTpsygF3Ja1+GM2Rqq8cLgTII481G7HAng+Tmxv
	QbOqvCd1iyFaL13IlnHhzw6fnaSVM91MdLbFtSFuB5NbnjuczQWlDvm+O8ljtbMzpz66hC+0nr0
	LoNemO6LAnkBEC8osik0AubcP+E75TTlQ3K8ntLZJ/g+6eBsMrFNuBSqoaKej5x1w
X-Received: by 2002:a17:90b:4483:b0:3b4:1877:8d30 with SMTP id 98e67ed59e1d1-3b41cb4fd23mr11751289a91.62.1795480541093;
        Mon, 23 Nov 2026 16:35:41 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:40 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH wireless 2/2] wifi: mac80211: widen the mesh IE offsets a u8 cannot hold
Date: Tue, 24 Nov 2026 06:05:26 +0530
Message-Id: <20261124003526.78471-3-piyus@iiitd.ac.in>
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

The extra IE blob a mesh join carries is bounded by IEEE80211_MAX_DATA_LEN,
2304 bytes, and ifmsh->ie_len is a size_t.  Two places that walk it use u8
for values derived from that length.

mesh_add_vendor_ies():

	u8 offset, len;
	...
	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;

ieee80211_ie_split_vendor() returns a size_t.  A blob whose vendor IEs
begin past byte 255 truncates the offset to a smaller value, so the copy
starts in the middle of an earlier element and emits bytes that are not
vendor IEs at all; len truncates with it.

mesh_add_rsn_ie():

	u8 len = 0;
	...
	len = data[1] + 2;

An element's length byte reaches 255, so this is 257 for the largest RSN IE
and truncates to 1 - the IE is then emitted as a two-byte stub, and a
secure mesh advertises a malformed RSN element.

Neither is a memory-safety problem: the preceding patch makes the two
builders cover disjoint ranges, so the beacon's single ifmsh->ie_len budget
holds whatever these values are.  Use types that can hold them.

How this was found: alongside the out-of-bounds write fixed in the
preceding patch, by AI-driven fuzzing built on top of syzkaller, then
checked by hand against the code.

Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/mac80211/mesh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index eb54bd98f282..4ab776e174d9 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -354,7 +354,7 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
 			struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
-	u8 offset, len;
+	size_t offset, len;
 	const u8 *data;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
@@ -377,9 +377,9 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
 int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
-	u8 len = 0;
 	const u8 *data;
 	size_t prefix;
+	unsigned int len;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
 		return 0;
-- 
2.34.1

