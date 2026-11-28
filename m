Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.163.59.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826431;
	b=sRgygzYPdF8TvGtIIEz8VB2pCfQwpFxGoT0RcbVNjHUKojqYQ1BjjrZLuCiTcHXSIaDl
	 nkdwllUE59Ih4YhTNoygNnATMAmv0VyQ5+758/tVoGQsrAm3mWJur2lHrJphAPs1aa7U+
	 j4bNhFa6Vl8iNmX2Fh3r/IooNR60mybB9tI4iTt6pJZ0X0T/dRicImfFesB7ahmSbhZ6M
	 YoJ2l/PkA3LdGDTIcClPAVRxZAaS11tHbdASSHV9oadtKl1qwUI0BPf+TKxjk28F1gH9H
	 WBubuAeLAVLOkCEWRmBXx/NiunRqrS7Mw5+4/zFC/q6/I8kxQj12MIR+3oW5sqlfCew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826431;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Mailru-Src:X-7564579A:X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:
	 X-D57D3AED:X-Mailru-Sender:X-Mras;
	bh=H2hZMntLjPLainFLIhHryA+8isJD850elzVs2K4qs+w=;
	b=ERC/l/y1PYPnsRVNdy43FvVvP7u1fnJ6wO31/mqfx2x4XRRBs1j94bFaYOb8T96VTYMv
	 mJhNc1MCSDWzoEXUaB1dms+eHuUUwDc45cT48x1HMwUlh6ad5TaaGK4lftmg+j4taiKjv
	 1BxamvQPdqYkht2UX89BwFICWOYexLfhm5+PVz/Vgwu/jke9tS4RK541cx2j53f2dEAXB
	 e0dU7MRFjwO0DtmEua8kxlBnN7aGrLTAPAP9aAqVeZIPMdU0S9kCIFxqJLg4CMm2s5i/H
	 b41Bf7Q+kV3TMFkPUMUkfL4jaW/BlaC/+lEG1DdhiaWVH0yF93HJ7OmZuhMhauBkdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ru;
	spf=pass smtp.mailfrom=mail.ru;
	dkim=pass header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=N03gsnaG;
	arc=none smtp.remote-ip=95.163.59.35
Received: from send196.i.mail.ru (send196.i.mail.ru [95.163.59.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303CE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=N03gsnaG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=H2hZMntLjPLainFLIhHryA+8isJD850elzVs2K4qs+w=; t=1795826429; x=1795916429; 
	b=N03gsnaGoihcfnCZRuxlzdalr2RN41frKMIhDQFCWsvo1M6e/nIWWbiRo3cHWUSgIqLqajmBtBT
	B/MF+wQCsv/ZFdQeahEZKUfPrA48wo3C0eJ0p/U0SxGLN/Gz6sxLAZFZ9xehaIyk03xu8YSfSGVt3
	u9FrmyPGlOyar15S8+1m/OZnhnsfKybRhAPV3H8w/soE32pTcTCyTxMGMyCnGeHQ4D0qMfWobB1H0
	pymkA1CqFyUrfsSyCuJ32LMf4QxdiiZBfejascStKvxEsFTr4ENSLh9NHKkCdRvP1rM7NI6OpgJH5
	Lgj41LTeTKf87KXFmuGuFtIquO/kletulYng==;
Received: by exim-smtp-canary-10-77684c7744-gggtd with esmtpa (envelope-from <listdansp@mail.ru>)
	id 1xX6UG-00000000TLX-1fns; Sat, 28 Nov 2026 03:40:20 +0300
From: Danila Chernetsov <listdansp@mail.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Danila Chernetsov <listdansp@mail.ru>,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] lib: interval_tree_test: fix division by zero on a zero endpoint
Date: Sat, 28 Nov 2026 00:40:18 +0000
Message-Id: <20261128004018.135865-1-listdansp@mail.ru>
X-Mailer: git-send-email 2.25.1
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
Authentication-Results: exim-smtp-canary-10-77684c7744-gggtd; auth=pass smtp.auth=listdansp@mail.ru smtp.mailfrom=listdansp@mail.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D70A5F1A44F40AC4984B02CC9DA0F8A0E2091737D616347F182A05F53808504071A0CFFAFA803B0D3DE06ABAFEAF67058E84F7D53324831625BBD0028A0D3B59CD5BE68A8FD4D49C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EFCED9770EA041F4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375669F88000598BFA233EB9F76B879C6F13A3D18A4B34A6A855213EDC0067123BB208EEF46B7454FC60B9742502CCDD46D0DA85A14DF5F041C99F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C012F9184CEE6480E98941B15DA834481F9449624AB7ADAF37BA3038C0950A5D36D5E8D9A59859A8B6042F1592492B88C63AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4931B544F03EFBC4D579E834CA16AA0C2CCC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5D2AC1AA3E276420C5002B1117B3ED696F6E0810AFD27E444B91D2EB2DEE3878CC21EFC0AA0C58C2ABFBD89AD4F5B216C1E618B5D5F965AFD97DA6AD59C166F02B2D1C9E48B6DC60AE2A7E19323554B12787CBDA4B9FA07ACEB92124CBCF2EAAC4EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6591E4B266248157916076BD09F9B1CB26D1DCA65A96FA1704FEE3C090777ADC209878E73AD5846AEB0B8341EE9D5BE9A0A5DF25E55392EE77DE665EC062CEB51BB26F6173994616A31C7CEAA0681F5848F4C41F94D744909CE04437D853D7CD20871FE3B1D98EC473624A389F0E278DBF4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWNVM5hkPswc/sl0Q2O/NArY=
X-Mailru-Sender: 4CE1109FD677D277CCA829E46AA49FF568867F41D5623724B951B70A5BD4BD8EB536AEDD130063A915634F2D3208598DC53BD13D3F6EEB2F3DDE9B364B0DF289C95E31D8FCF52BE1594FB4C9F0DBF4120D4ABDE8C577C2ED
X-Mras: Ok

The test draws an interval endpoint with

  last = (prandom_u32_state(&rnd) >> 4) % max_endpoint;

so last is in [0, max_endpoint), and then draws the start with

  start = (prandom_u32_state(&rnd) >> 4) % last;

When last is zero this is a division by zero. The result is undefined,
and on x86 it triggers a divide error and causes a kernel oops during
module initialization.

Commit c1fff9794a16 ("lib: interval_tree_test: validate benchmark
parameters") rejects max_endpoint values below 2, so the case where
every endpoint is zero is already excluded. It does not prevent an
individual draw from being zero. With max_endpoint=2 about half of the
draws are zero, and with the default max_endpoint of ~0 it takes a
shifted random value of zero, roughly 1 in 2^28 per draw.

The same two-statement pattern is used in init() to generate the nodes
and in intersection_range_check() and span_iteration_check() to
generate search ranges, so all three are affected.

The only interval whose last endpoint is 0 is the point [0, 0], and the
tree allows start == last. When last is zero, use that point and skip
the modulo. Behavior for last > 0 is unchanged.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a8ec14d4f6aa ("lib/interval_tree_test.c: allow users to limit scope of endpoint")
Fixes: 82114e45131f ("lib/interval_tree: add test case for interval_tree_iter_xxx() helpers")
Fixes: ccaf3efceefc ("lib/interval_tree: add test case for span iteration")
Signed-off-by: Danila Chernetsov <listdansp@mail.ru>
---
 lib/interval_tree_test.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index 06f77fb3179f..a01ba4f16015 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -48,7 +48,8 @@ static void init(void)
 
 	for (i = 0; i < nnodes; i++) {
 		u32 b = (prandom_u32_state(&rnd) >> 4) % max_endpoint;
-		u32 a = (prandom_u32_state(&rnd) >> 4) % b;
+		/* A zero endpoint is the point [0, 0], not a divisor. */
+		u32 a = b ? (prandom_u32_state(&rnd) >> 4) % b : 0;
 
 		nodes[i].start = a;
 		nodes[i].last = b;
@@ -165,7 +166,8 @@ static int intersection_range_check(void)
 				last = ULONG_MAX;
 			} else {
 				last = (prandom_u32_state(&rnd) >> 4) % max_endpoint;
-				start = (prandom_u32_state(&rnd) >> 4) % last;
+				/* A zero endpoint is the point [0, 0], not a divisor. */
+				start = last ? (prandom_u32_state(&rnd) >> 4) % last : 0;
 			}
 
 			/* Walk nodes to mark intersection nodes */
@@ -272,7 +274,8 @@ static int span_iteration_check(void)
 				last = ULONG_MAX;
 			} else {
 				last = (prandom_u32_state(&rnd) >> 4) % max_endpoint;
-				start = (prandom_u32_state(&rnd) >> 4) % last;
+				/* A zero endpoint is the point [0, 0], not a divisor. */
+				start = last ? (prandom_u32_state(&rnd) >> 4) % last : 0;
 			}
 
 			mas_span.first_index = start;
-- 
2.25.1

