Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059630;
	b=LhOTirZnLGpqLbx1xKcriPCLya2CQ3ZU4s3TuGE+VnioW/cuAlixmRi7krwVtNKkDEO1
	 1khHO+vtAHsEcx9JieOLtTgpj9CSH4/x0+8vH0HReK43g+2dwMU5VIIUc+e659gdTQL/L
	 knxJYwIVkIrdo167i92VSqt3kSkecSx0DO4mMQ2+1+vkUMRrf3bN79l6lEVLgQpm1GFqn
	 ZLrvSlSFnkuDnyCjtM2YC1MW0DJ7p1eQH4f/j6/YqBMUZ42xxWAKvjR+NP0ZWb6JxeHHq
	 KmmJPQ25zv/5ieqimRoxHZTVZhBijCzzgqibnvgIDHAv9HApsJi/MoXzdOsZ7FILKAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
	b=ZlBgD/f5UMBgkPqLbR2+yvfmnWU6irm20zqh6ud7Nu6bUhZyOxY5YqRRmRHgjb0uqTBo
	 bjjZaEWqnl/9szAqHZq0xA4+D4Fhdv/DHLa/SMKfcK3WsePsR8aPozTGyqSUTxXRp+hwI
	 a7ztFXoQaV6MTrOZHfuJe5NtQHFUD72C40ex9qOqevQh0GwZ3kacCrknQyUMbN2ZZJaVt
	 6ISVazES6olBvSq7Px6YsDeE1zUlyAMnoSD8diq92BKyp92yHBWL1dEHTsqR1lF9y9Q0n
	 A1om0dJFTPzNSlOneVE1+TPdeknlfypDITTlkY0SIt0H3ZN728ikCiC1iGHMcDC78DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrBhB9ik;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B11606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B11606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrBhB9ik
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so4862720eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059629; x=1795664429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
        b=ZrBhB9ikiz/orZOl5HSwNUloNt66Tv4RuAld6x1CZr+9REgn+9PQgxeuWHeECiHhi0
         nxdwjGc0W4G0O/szdJ//rnIUsm71UZR7uVCH/bqIyJK9QcPXDtzy989Ujln6cpCNjp1r
         xh2KtVCgVXzQoicYilZCaD0MmA8FkZoMCNj8SlCofDQ/w/ln5FfXf+gxK9scMLwf5HI9
         aZNjY+LNd9OlXPwSHciUKENRbqOenW6H7k5/UqULCC61BSGtVODwYD7euokMk4JeQD9/
         8jUuqi9CSmJDXX9qVHAqawg6ToyL/pREvA6/1YPXdglfs4DjVC0f5Wp8BbZhPqqHmzc5
         PDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059629; x=1795664429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
        b=bJ86i9SQE/NgZhhNora+qiMtkweNoGLcDQxQZQBatB/NCkIzcUDqpqxwsvHHQSsHPE
         oddPQ9Cw5l2QPHWCv8w4GPep4dLg72+NQrXs1R8OTXGrvTqKTxrInQntA/qLgY9C4Qeo
         nng9GpIKoOfHlCzEZGYWaDy6Uxopfi4mlL+jhoBOU+VbHIFNJ6iCPKrITuUto9OuXNEU
         uaSSXFdqGikcq/PFvVWVuHYCfMEmI2HgEsquLugy21RYDxXZFqTAYHk2YuORoREl2+Ku
         xfOpkJnzgzEZWV4p3Jm8DtNHgOYYyKycxFTuZthQbgpyXJ4b/9p6eaANRvgACd7YK7Ba
         ut1g==
X-Forwarded-Encrypted: i=1; AL+hErGTAgqMnbtFdT8AjoG1MraxMsKgm4BAKvRAxL1PWSGEFxT3+/B48w+xPsS2EHJbsqAZoZETw8ayL+v2390=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dBX63CLl86Bfz0j3QG3UIRfIfd9ckZ+pjVJ1ObhogErxyUujh
	bxM9XHzvkIo092NOJ2hrmVpLR5iU1cQcAFdLy1wqA1KjtkZhJ93IRwkq
X-Gm-Gg: AZFdTZeg9lUfhiWTQwMQNOnTXZxaOONZ/YqxJFlrdSjEH+3FJ0sw5imfA30QYxJ0Kmh
	zTfa9qeEjJieb1Mfs2L4P4LVP2v5qxdykwnmiLI4GdFvoaAeH/gBjOXzmMxUtdnpT8dm5PL72CJ
	zfHy3/AR3Ru0B1z1pQw+dXS0cturKUzvkBvKflxOnYojsqc+cgCx6BYhyo6tQNT5ZTyo8bp2Bra
	xG9UnlI3q+UyQQjGy6n9CNgVM4uE6Ltcr1z/6k3pLzBvsFhpNhZpjg4T4omMr7wAg4M+dZgQv1E
	+8UeNnnkauRT5UCJKSwfwjlHxtmOCcrbqEKwBvEWBiN/MV7QscL9Cd0t6+aFJQFt67f9I4FpchX
	yKxnc+qp6IUaT29A1w4pRLYMAt/vp0e6wtGmUV5Gpf6PNR1DnmCLUVXxSDiDg6M+nr3nRSlPnWi
	dnclK/oKP6ZyUNf23bqw3p1XjzPCmU1ot63JlE7TV4900nfzf1/OmP+lAl7SpMN8Wu/wi4sSGyZ
	eWC2VoM74mDdiGIjATU8B7jiOhntpZhbu4N3XXFnPs/UY01/kIMKpy4i4yRBWXyxURHZbyLPSPj
	RIdPYzvH2/SXvsTHtHuKxZKJcT24hRMzUQ==
X-Received: by 2002:a05:7300:6da2:b0:380:d99d:ce1d with SMTP id 5a478bee46e88-3828016fed0mr5984047eec.15.1795059629049;
        Wed, 18 Nov 2026 19:40:29 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:28 -0800 (PST)
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
Subject: [PATCHv2 15/18] powerpc/pseries: Disable context analysis for the CMM hotplug notifier
Date: Thu, 19 Nov 2026 09:09:10 +0530
Message-Id: <3a50c40b9f72c5e67f06e48d1db1359f3fdf3a73.1795058683.git.ritesh.list@gmail.com>
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
  cmm.c: error: mutex 'hotplug_mutex' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  cmm.c: error: releasing mutex 'hotplug_mutex' that was not held [-Werror,-Wthread-safety-analysis]

cmm_memory_cb() takes hotplug_mutex on MEM_GOING_OFFLINE and drops it
on a later MEM_OFFLINE or MEM_CANCEL_OFFLINE call.

Add __context_unsafe() annotation for cmm_memory_cb() callback to avoid
the reported build error in order to enable Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 38e22125b96f..159efe734785 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -470,6 +470,7 @@ static struct notifier_block cmm_reboot_nb = {
  **/
 static int cmm_memory_cb(struct notifier_block *self,
 			unsigned long action, void *arg)
+		__context_unsafe(/* Conditional locking */)
 {
 	switch (action) {
 	case MEM_GOING_OFFLINE:
-- 
2.39.5

