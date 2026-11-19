Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059576;
	b=JxTsR9wDILfAVvUrZYLWSw3F6cmDj9J0EU0SuqPHmyJn0rLT7p0sDFhcrt+p9oJ0qmQy
	 RgqAzOaMQ0FIP+yUPu09iFq/0j+fpFk+pDGKPxot/PVdeEK8qimS6c8U4Rq+y3gIe6poG
	 NB5kNp/4ziUUEQ0YpGC1yEuyT2stwFAiN43YHBnCJ6rOR12iG0Jp40rPMoV6Qhp0pk7nM
	 GeOpoL93dgBsjS50qzLASTKrv/V533WSlB+I4ID+MbhvCWyVus22iXvKg8aUzhpy68S7b
	 kpn69Vv0MPY8CeGKUDqb+oxJtgUqPrzq33+nWYCXO5ZTssWGY4hWkfE1eboaizhw2Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
	b=Uv0il9iCRdQST1Ioeid2oaYJ9+zgWmC8R0m8E6SnvMyPq0vL3DSTyMz+1wAF3Eg9iaaa
	 OfgvPqUwOqm+cpznUMxY6iSR1R60wPkgkaF9tvp1AjiOWxhRl0oxdppmydKVS6bAy0MVd
	 i5V/5wUXwA16qzDIBH92U0mJ1l3QyJJTtIZkEu0qVmttI33sYpEGSiw+qwp5s7c3Kv4Pv
	 BOtvQEFsfD7HkRRa4j0zBiF6puLNxHLI2YPUrWcA3Ipde9BLNdshPSn7+w1cU+Yxm1iY8
	 RymCxlC0o7a44YHsYCsBpf/Om2ovi5RrAVIPUf0muMJ0AAMB/8zjNREho7K6BxdYPXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/F14SOI";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B71606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B71606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/F14SOI
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380c28f9e35so477364eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059575; x=1795664375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
        b=b/F14SOIvwxe44QuPlklpeNNK+qs+Q8ggJlXHmsa/RyQ67lc8u6ChGW3+lFPGVwysB
         Bd0eVeBMBLFyrzE7Uz23zvs2qTVd5v0zkvg9a4Cp9vKRCdIjkTI2cBrX0Wh6P66fAPWS
         Ee7SYmGA6hMi7PEAiHuwtSsE/tYJr5JYfe98bnDSLIlr7hXd8BUYKWIOfUUkWw2k1htV
         Hb9nGNAUHvmtiq3UiUQXD8Ed5VMHcXv9hs5JayhxTpfhCjRmHD2cH8FAvc2dAhP/06NV
         0jdGsl1+uOFLdVIUZSNhL7oi2bcm3jbccf7eDKh9zeGKPPP/dOLDZKewWSZMoTSMJhoO
         a70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059575; x=1795664375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1fHiW/q9wws193uauriObWBGAQjMBTx9YeqyoW+PZx4=;
        b=gLlXTFjsHPpdlNlJKxIa1107XQg+XbpsZ8xlPnN1tY2oSMc4jVQjWeJOWuzKhrvuB5
         OZq4s/cXYrl0cSqNhBEEkvg9EqSVULJ9WERwhfpcX37IB/yBrhAPI4DyffEkuCLSqZ0t
         nfZ/iSMCGS47/GBtrbsSL/msZkaKLd2Ksi3G9AwG1mjw0GrVx4nMriN4mlebc7OwcssS
         nHSPuvrZSRsetVP65wPALWxMrMvyId6pYT7hd+ZAMkvpXLa0cBfhQ9QuSqY1pdj0zgKr
         Has8uTHN51MsOzIlMQyjG9IuVoBHJs4icUKlnhc2mNk+M/V+Dy0ze5BMcWMetbCxvqgB
         Zayg==
X-Forwarded-Encrypted: i=1; AL+hErHI8muOvUoA3sLY1g/J3XNjQjFNkxo3XEA9bkYE2mfQlI1YuTvW7782O9QnTFMx32DtovtaS/V9S0ICf9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3CSejyR82IuVXlVuiEt79JyN/AR9iN6BJekwTknuQ3IiSITZH
	es6cBus//Ep40ICdjL/v8W3nLhhp+IsQsAS3jLP9Bl/EY7t6EkAHHPOR
X-Gm-Gg: AZFdTZfv+pcYLzozhrzc+LL+3yTh11EK3StVMY4TGC4naxKC4In38CB0IIzwyyXCVvs
	kQNECmT/01PQU7qder90CrfJHiPleuat+Uh1DglJdvISscA4Ay+5IDM/O6ZeD92l2MvaAsfojHU
	A/d6DPL8+5Bslc9/jFAiwmgenh5BlsDe7kkRqwDzQn8Qw4EC++7Tui/JgQfPZttXT+RkuhzSZgI
	fOsEqdeav2Hwn3sJQUqLlMK3MHfrxQ05beSTaGjWVnh2o+yVtG7THlapcHaMHBd4dvgECQgwEa0
	oiPHSYLDGsBMbWuUpMqbBLwpVfHfFq8JGPTEL0mknM2j6XUyoPsYyHJ4u+Z8X7i4woi6iv6CJTE
	KXGVxhdFLftAZfEzypoEDwnw5dTH+9ZkLPhwlsmB1z33yPscgFX31QFhb5517AfAKHts0XuJ3qW
	C8fiTzoyeaiK9wMzQoRV33USRDCzG2yNwoVf0KpGrzPIYtpc8U4nGTizVJNTal8KH5p3gxUeHdV
	s2kaVlbJOnO82Vb+tleFNW+CecZnWhuBNCjLv60YtXi0zlrUqY1HiE86R9G7dqnjPoCL15OUyax
	5oQgI+MCc/ZRUQHoAhDYlhMB29o1NIBhZg==
X-Received: by 2002:a05:7300:b197:b0:369:f17d:efb with SMTP id 5a478bee46e88-38445ee9e1bmr652518eec.10.1795059574672;
        Wed, 18 Nov 2026 19:39:34 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:39:34 -0800 (PST)
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
Subject: [PATCHv2 02/18] powerpc/mm/book3s64: Rework tlbie() to remove conditional locking
Date: Thu, 19 Nov 2026 09:08:57 +0530
Message-Id: <f6de49ee75ad37cceb9b67bc1d79ea64fee19258.1795058683.git.ritesh.list@gmail.com>
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
 hash_native.c:235:2: error: raw_spinlock 'native_tlbie_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
 hash_native.c:245:3: error: releasing raw_spinlock 'native_tlbie_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch reworks the tlbie() function to remove the conditional
locking. It fixes the clang context analysis reported errors. However,
this also simplifies the code around tlbie[l] - which is also a win.

No functional change intended.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 34 ++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index ab2a80e59011..6bad0545b57a 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -222,6 +222,23 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 
 }
 
+static inline void __tlbie_sequence(unsigned long vpn, int psize, int apsize,
+				    int ssize)
+{
+	asm volatile("ptesync": : :"memory");
+	__tlbie(vpn, psize, apsize, ssize);
+	fixup_tlbie_vpn(vpn, psize, apsize, ssize);
+	asm volatile("eieio; tlbsync; ptesync": : :"memory");
+}
+
+static inline void __tlbiel_sequence(unsigned long vpn, int psize, int apsize,
+				     int ssize)
+{
+	asm volatile("ptesync": : :"memory");
+	__tlbiel(vpn, psize, apsize, ssize);
+	ppc_after_tlbiel_barrier();
+}
+
 static inline void tlbie(unsigned long vpn, int psize, int apsize,
 			 int ssize, int local)
 {
@@ -230,19 +247,16 @@ static inline void tlbie(unsigned long vpn, int psize, int apsize,
 
 	if (use_local)
 		use_local = mmu_psize_defs[psize].tlbiel;
-	if (lock_tlbie && !use_local)
-		raw_spin_lock(&native_tlbie_lock);
-	asm volatile("ptesync": : :"memory");
+
 	if (use_local) {
-		__tlbiel(vpn, psize, apsize, ssize);
-		ppc_after_tlbiel_barrier();
+		__tlbiel_sequence(vpn, psize, apsize, ssize);
+	} else if (lock_tlbie) {
+		raw_spin_lock(&native_tlbie_lock);
+		__tlbie_sequence(vpn, psize, apsize, ssize);
+		raw_spin_unlock(&native_tlbie_lock);
 	} else {
-		__tlbie(vpn, psize, apsize, ssize);
-		fixup_tlbie_vpn(vpn, psize, apsize, ssize);
-		asm volatile("eieio; tlbsync; ptesync": : :"memory");
+		__tlbie_sequence(vpn, psize, apsize, ssize);
 	}
-	if (lock_tlbie && !use_local)
-		raw_spin_unlock(&native_tlbie_lock);
 }
 
 static inline void native_lock_hpte(struct hash_pte *hptep)
-- 
2.39.5

