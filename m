Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059613;
	b=u+yOw8LXCCLhwl5pBu0AoNNXEJYdnTxFjfwwXEtgwsbuIkXJt1AIPGyc5qMrkKWcUBqB
	 XMS3wTXhYlPZ/zvr/L28SlRbfua/GVkokkmz970/PUqiZlwHQtjegiO3l9uvupA/6YlTb
	 wjtnivv+thvirh67ROotj038jk0nie4nIRPHTXWDLrzL9gTWCd5iFDPl2Nclg6p4STP4d
	 bvo4TjwnTlyCaf3sLmFdx8nMunNUb4t4se0kLjn8UHpGx9eSlsIgB19v3LQNne/xBQEUY
	 zGwwoUzirMeyYG0ZMVyH0mEjRPXNLF5oznknEc3wquM96WBloV67/oFw4w8VfwyqW+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
	b=A+3rz8psYEc/uvAWDHA6ADaNcLBs5HqsoFFeKBQZrz5So9dI3wV3DQl6J21a+AxeuBcS
	 zrCxOwEp8sk5De8rXAmc82BQ58Dr6NcTaQemba+V4ljfy2jOiMll5uwJ+mGm1Oy3f2j2n
	 JQyuU/3cAcarDqzzMhZ++K6T/UXXs5BcGYXJkeZ9dpDhBgeK39bDVrHalBKPbNoMxuJ1R
	 os6lrv5Z4WBviV2wDl5zMHARHU/9KRwMv3OGgHqQK7AgHzWhbgBsgei3opCxLa419kLw4
	 pDHk1ElOigo+6gPKJjSIOvj0qShC1QTwv9HU2eGbX3QH6N9U6DHxXmQJffbuF+OkAyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhH9dPbt;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B560A2612
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0B560A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhH9dPbt
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so4085999eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059612; x=1795664412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
        b=yhH9dPbt8hwK6VwB9mUrPEb430HFhia/RghP3gawSzMgMxLo1EgKD9FLpV3+p68YK8
         WvKLZ/VPslSPbwmU6zJe3Q3d9z++/a94wti7N3rBXWMdAXYe+dEzQMe98hP9XGBpbWIE
         w5IWmYk1h6mTTmoNdDE5LrBfBPzPruFu3gzS4omyqyL95z1d0MBDz//T9oWCPkvlvoaM
         NeeFMoJpuipajzbUIRhCAsmDgbq1dPHRWAMtdjU+kUmuD2sODv4YoQZipTqZ32Q4dyBb
         7bxU5Zhp1jK5eYve8EelkhRZuH+h4t1rYyHgvtDQsFzIvDqCniIrUvUlZTFFJByuaEu1
         8zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059612; x=1795664412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNfLUpbUrpvHXxk7v5s6Ji6TChmuV33nC5/6JAhIS7E=;
        b=AymJig3yNlEoQ3zWb3peEC8fiPVyoLivkK368DqhDIlAExszBTYT8eDtFrVDzRzFIb
         GAe9NyJgXlCX3HSyqwfIm7r+oGdedwWAmUl7atdFCu7BPT6p9q9QqXOjxvnOzbqOEng0
         VYauUFMLkXSSonrfFDNE3NvWXA/UqSh3AxlDnmgXehjBKBs3zTW7qKI0jqmwfCFPTz4m
         oPDVCS/EhE+wYbv4qL3KGEZCzQy1CTNdKrXmK883gVIjubKLr/of1gIn54yi3k/Y1PGD
         j7P0nJaNffbfdc0AAYr5+nvvKNKErPS7vZ7Vu+51lxPAgxJHwKflwmBNoT64kwOXusHB
         APwA==
X-Forwarded-Encrypted: i=1; AL+hErEVZrV5GP5E3uipN3v226c63q3mloVL/cb/nLPclpbNKla3isYsQml0o7C3zGJ6aPAnsHOQnmdn9Zg1a2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QRPYOiuM19kXjE7ZTBKzz8rsOd75giz1kHC/zffg1FtJJPqVx
	hW9seQNWIQA9stIBRc695vfqaA68Uer/gCf65ax3CS4/HIm2IedUwwct
X-Gm-Gg: AZFdTZcEmVd0P57GKuiQMfTbWzhFIBlKuikZKxXhL1dVNMZjdTk4CdTUnUdHDBKCutx
	lMTJE1s9g5TnAbEa9YAodzZFTpBJNHHKQksAuxKOUlrgAuqQ/BN+i0GCxHcsUv5yozxI7wl+aCM
	d3+e6/+e7IoZ7YpT7yWE8Xh+hbqPSzxH+v45t+zr8KODs9Wb2+wflzdItltmeUQAC9tbMXoEYJ2
	m/PJ1aQHNojXok4Yrgl7yEpDVn07P9oCplgwqGF9HyRzQzCEgunJZhfkA7C9ojW5yzoOhzWPkB8
	/fHjyUhfPlvGMhCZ746qw1+OGENPotk5GMRH1R3fxtL+0a4eIErJWTGS+A7wbJOVx4XPgorBkK7
	iGUDV/I+NBhw4papLov2tGF4jf17LXODCMPMeKzAfKca2JTXO/RTiqk6D6WBc1/7Uxcmkvq0S4L
	FsiNgr2XgtABcXyMYts0JcBU4R9Gkubqy+TsrZzh53DwJ8iAFlyoNXvkb5LbtWBP8l++9Jcc/qs
	CtO8Znyp2yXMRvG18ufj6IunAUFkkANb5+OPgWsX+PBDo79vLSsVB1mmloGJwxOC1um1rt2Uq96
	j/nbcTtGK3DMG0hL+A/CyX9SbOF4Il+uDA==
X-Received: by 2002:a05:7300:bc03:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-38281427c34mr5865682eec.39.1795059611987;
        Wed, 18 Nov 2026 19:40:11 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:11 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 11/18] powerpc/pseries: Annotate the VPD sequence lock context
Date: Thu, 19 Nov 2026 09:09:06 +0530
Message-Id: <38627563f85b033e3ad50297d811a68b13588a62.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  papr-vpd.c:151:1: error: mutex 'rtas_ibm_get_vpd_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-vpd.c:165:2: error: releasing mutex 'rtas_ibm_get_vpd_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to in vpd_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-vpd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
index f38c188fc4a1..8d210454cff1 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -123,8 +123,10 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
  * @seq: vpd call parameters from sequence struct
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_get_vpd_lock held. vpd_sequence_end() releases it.
  */
 static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_get_vpd_lock)
 {
 	struct rtas_ibm_get_vpd_params *vpd_params;
 	/*
@@ -157,6 +159,7 @@ static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by vpd_sequence_begin().
  */
 static void vpd_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_get_vpd_lock)
 {
 	struct rtas_ibm_get_vpd_params *vpd_params;
 
-- 
2.39.5

