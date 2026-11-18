Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967863;
	b=csk7xGastpdOsMsl31Rj5AaMOXgFUlaQbiJE4kzGQvKNZBUY31i/9HEGDS8AYbfdAp6z
	 81AI0VZomJFmrwDnIgMssltA7umzx7nz3d6S0XqFg2e2M+8SehRFQmCalXoKekOJK+eve
	 NMOOTLZ+Hp9dAEQ9iypXkVOyPeUJFp5ZZ4X0qfoDDTFLlu8jT71mRP1dxCoQzwooHxJO5
	 RJYEGrX+CS9DR6FMxpbxnTEyMkMLe2/oO2ymvfZ4HGrvyyI4tFhRhQWp4f4zA2s6gryE2
	 Dw0p9MTxR3IIX+XCev+ZyyVh3zMKvdjzTXHQFmwjrxZpDpp68T31+Urv/4ckFSyCNeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967863;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ziy1w63v7SeG7UKq8aHtdaHbjEeIY8YSPukZ/uZGJJg=;
	b=m/Pvr0K1Jwzw8QcukKJulFbue81WQ8qzjCLLS+8/ESgzCt0ctfYB2DitRnpMmJm4Uxm9
	 l4QY8UFzsTLiNdErvvoM5k/q4TUc4Z22jOGHRIj0r+RgLQ3RxGsnbKbiU39jSBDuTukBa
	 KSkrnBjlNVMzj6zhXuoyQb2WbpAMh1vNQQADml5ddRgYcEFoAgkj7SnJwPznxjy1tz3uG
	 +6aeD6sxqU7e+NHt6+35vsMZkeat6TemuSKdnPuZJp0Pe1o9uwd0wLPT15DdReeZjt/Ld
	 KklSf1itrC0DQje6/SNUB7wooGFDOuixkHpQXPN7dvHBhOXdvojUmyaW5Ddcbw0MMpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timdoug.com;
	spf=pass smtp.mailfrom=timdoug.com;
	dkim=pass header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b="c9WDN/jq";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="W0K/zCOc";
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30000606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30000606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=c9WDN/jq;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W0K/zCOc
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 533E0EC08B5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:11:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 17 Nov 2026 21:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794967862; x=1795054262; bh=ziy1w63v7SeG7UKq8aHtd
	aHbjEeIY8YSPukZ/uZGJJg=; b=c9WDN/jqtzX/5BeXhh2eri0C1uWgwWWN1gpJZ
	BbS40cU1opj+XxWlJNAjSBNr7G5tGlRtVLK9NURgyho4Ymo+AnCdF1vKBgrVS0d4
	klu56k5m2YBVipeaGjLMFpP4tF7obuThOE99PXz9FRVKhs9Ww1XybJ/fcy1EO1UI
	3OmMZ0Q/LChEcvBGpc9wcKAYGAkkAliprIoAfss1BodQZcU90H9cSdOb8rbPmL/e
	fJFJILG2PqmubLRkxU1998PZQrdRgTjq+wOJrQ9qUdne25m8Ey5z81j7P0DxPy3Z
	xurvra8iFtWU8AdaBe97s2UNLLTBZwEnjCQkgQ7a4pno/XG4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794967862; x=1795054262; bh=ziy1w63v7SeG7UKq8aHtdaHbjEeIY8YSPuk
	Z/uZGJJg=; b=W0K/zCOckg0S5q82zT1oLR/YWN+pXLUn0pEyeDSawP8k0pSUjCF
	LGhI54ZJ5UR1DUW89UpGN5BUCfuFTxnA74oKG6fmh+owA4AyW7ckNoFJM5KMmTh1
	pCjuLWfZSXY2YaApfxC2jONlWzTn2aAyLARqPIITiS5MH0dVxTzYxpgkjXsMLy+w
	40r9J53Ptx0ouxssI1zKsysT3nLnq9hkcXYvMigsLeGWp7TSdHRYJlN3Ct+RYOIf
	989BkPR9TWm2hT5SrHuGMW+HUBqWkA4jblRVKB0tMErsWIqNTub/PYJAkt5HtV7W
	mqkrCbvLLfW6EvCDr7qchZzJ/8dj1r9EfmA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794967862; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:LgXgah7INtxuY3OKUdA4usxYs1e20ONWG2SZ+DexmLz++O9
	Ob9DogT3Ld2bKtli21j0ocLTWgDKOZhx6jY/thXbNglRnIEE+v+e0yZfB2HiEHO4
	DvhRnJnwjKvam+9uXMfHKrBrJc6mmxXy9xntDhNPpS4e4Gcrrab7+7ZAwyLdzvIC
	iot8GFDBNXBGo/n9neF4yW2/EeZJmvi5t1tzYdoP281b7ma0oMKENkOnUm5STy+O
	OsS+Sh6+WiEBRSYass6HpVf6Ijr2cgPZzgAlHk2rNO2SknraXqxfvjh1v6KU+ggX
	+wK0nF1UCAUUNKZvGcz/zcs1JqF+iIXq1Z8JHvw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:7EdqGiKLdCF3MKtOwJCAEcebBcuCV1VzQl1rJ3W+QMo=:yzYxXzsAIOIPV1qNp7Ts9sHjwkwvUnZdtCS+R34Xlbc=;
X-ME-Sender: <xms:Ngn9ak2U8OqXsu94CjfLh4rMGCqPzY_Lcij7mYBg-gynJC_MJktOsw>
    <xme:Ngn9am3WcpN0l07Ww61jGkYx7-_ZcZ8avQ5zv7oEwfDJt3ztcHGlfoOSlCvrCpjOv
    usQVMbyBieGe3KWUiplDDFGzMg_88NpN9sPqolDcN0uyLDBSZvJYg>
X-ME-Received: <xmr:Ngn9av-1aJHYF4VSrgH2IxjxQKxQDK3bkhuURkUtFuNJS9rZbrT4KL05Q9dD>
X-ME-Proxy-Cause: dmFkZTGjbgA28vwLdPbFOdf7H0ccPQuCqgA3cR2SqcqANF9B5xKZCzb8tjc/E2emOU9724
    f3qU9uNU0kYTjGlti8J2WNpfJk/vgeBG7+oGn7d04KFyg8vGlwRd4ay4YSYFBYQcmG9n83
    4y3x6ULYlOf+S4IU9tE2w73GTfX9sjG0jM1EoUadHvIFGZaVJts51KChwbn/H3E94N6ER8
    sUeHoYxEjJNg2yxAZt+qV/kwBA+j8HgxxOOF0B8fwx/waG4NYuGEtc1aCL49v8z/MUiEsK
    HhBjkzZO1xrHLWxX5uPIqCZDxT4kyR7r/mHlup2KFnHBebb6NEEkGrD1PEhDu8PVroRcpw
    Suyoklh2M9FhyBAavuJaOod0LkC9QD6x0OzigrIUoa/llLdme4mj6qbiPDEvZUoB6zDXky
    ZIyr0GDuj0KuiVX5/wztrQLpjYdv1iXZCy2JnSDE02bE7k6OBVZ6Z55kuyuUkIxHfbP3U4
    pRlaEK6z7rbOsQH9UinyuQ8IAt03JRp4cWjahgokX42UECJBTcaeH1d93EGVunvzREkJfR
    KC1ikhlVBA/Udzjgc4Dtt/hzboK4nNORDZAUUWmKSm3l3K+XNBjg5tg6yKYUzmOsK1JW1m
    AsMg/6+08qxq8NAiDsBzcT0/tbmRbQBAKFxFag+fSiou/+jp78nXf+us4bgA
X-ME-Proxy: <xmx:Ngn9ar0YvvAgGZjvmMS5QS-QmG6MsUTnVOQNuRGAs2rp89NIt2N9_g>
    <xmx:Ngn9ak9gOW015vTFIwMtrKIKqhh_tzJgEPPBFX_VF6vcBUagZGDIpw>
    <xmx:Ngn9aju897v2Uqj52oaLdUXr8BGsT7WJrL_prvuTy6A5rgvdTjLxRA>
    <xmx:Ngn9avA05rmOppATMIrcs8mgi0KT1oy-M9_2MddQxG7ZgigOo437Zg>
    <xmx:Ngn9amTDLlEDqI3balmrBSMbDKYPPjPapoL7oVfAJOTMlEIzyDBJ6EEg>
Feedback-ID: i12bc4175:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 21:11:01 -0500 (EST)
From: Tim Douglas <me@timdoug.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] block: partitions: mac: record Apple partition names
Date: Tue, 17 Nov 2026 21:10:59 -0500
Message-ID: <20261118021059.84192-1-me@timdoug.com>
X-Mailer: git-send-email 2.54.0
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

Early root=PARTLABEL= lookup fails on Apple Partition Map disks
because the on-disk names are absent from the kernel's partition
metadata. Copy the name from each entry and append a NUL terminator
so that names that fill the 32-byte field can be used.

Tested on an arm64 QEMU guest with Linux v7.4-rc3 and no initramfs.
Before the patch, boot failed with PARTLABEL and succeeded with
the device path for the same partition. With the patch, boot succeeded
with both a short name and a 32-byte name. Boot with
root=PARTLABEL=6200-Linux was also verified on a Performa 6200CD
using a kernel with local platform support.

AI assistance was used to investigate early root lookup and draft
the change.

Signed-off-by: Tim Douglas <me@timdoug.com>
---
 block/partitions/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/partitions/mac.c b/block/partitions/mac.c
index f372392af..da170a65d 100644
--- a/block/partitions/mac.c
+++ b/block/partitions/mac.c
@@ -100,6 +100,12 @@ int mac_partition(struct parsed_partitions *state)
 			(sector_t)be32_to_cpu(part->start_block) * (secsize/512),
 			(sector_t)be32_to_cpu(part->block_count) * (secsize/512));
 
+		/* Expose the APM name for early root=PARTLABEL lookup. */
+		memcpy(state->parts[slot].info.volname, part->name,
+		       sizeof(part->name));
+		state->parts[slot].info.volname[sizeof(part->name)] = '\0';
+		state->parts[slot].has_info = true;
+
 		if (!strncasecmp(part->type, "Linux_RAID", 10))
 			state->parts[slot].flags = ADDPART_FLAG_RAID;
 #ifdef CONFIG_PPC_PMAC

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.5

