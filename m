Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147477;
	b=wlt0Bpsrhf6ZHObaqmVYtrTcTABNHt5sRvymqqNRYQtgohf9u3ZL26RgHQvMcXhAwiNE
	 chemeolNsBDHK4ZXY5YAsa2CnCeznIrPQr03bXaHB7eSVeXViK0mE7oRBGnnyX2ttiu3k
	 4IvVWwgayO5TheP7otozScE/PeQf378fi0zTjqnE7ZHyMGcXT60Grj3U/WE0wV0VdPppn
	 rO/NLcjiRaMxm3M7nwwV2tNVZLWka4GcNTEC+g44jHXKAFzCXBG+yUD2+hUt2+zmHG9eu
	 /tqchBVYbVoqkuHrCRr/AFdP3zRlrGV+B1l8KbSCjTfmBfZf59k0JtKS1bcGf64BgRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
	b=H9DdkZw9SfoQ9no6S62brqyXMTYAnXWho23Nlj7cz2rxISlm1tV0tJywtrdJeFI64H+g
	 lhaZGAeAx5saPC8VUfDRqxHW27QdkFNcoa+k8iPN0vrhhXyRkUQwN4vqM3gGfCPTUp/O8
	 ocMXGYrC2XABHtR/ZSWA4gVnweKm6IBE4p01AcxyszNIjmki6mJr1j3XjOWsPNyHDM2HC
	 gyKSIEivJkVztMeWehKC0HtCLXSbhtVt+LYeFtdMszjXKgnTgu0CLNjuO5BvDLaMDUfxm
	 RCrkj+H1GG7J0tDVhFQRpSYs2mrJtnpPzVHG3uEEhjdVS3NFaYyky8Ov+sweqLReQzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UjemDet6;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D24606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UjemDet6
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381f65e4e4bso703878eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147476; x=1795752276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
        b=UjemDet6ujBsNeLUmcbS+EqaOSS1xTiw0vgk+KDGAGhfDyG1nJUxsayCecOui0TuUc
         9hFwyQC1+28QRILLLmNJMMjqpjeaeEobxoBldvH+KOHoHNuCzquTgn2uG3qNoqjggs1U
         BC5ygj+/T99ZGAheL+JUblqoAMXhcxIKExMzHYmL4VDiJ6NLGpllf987uvmCPZge2ptu
         S6TC/jw+4DwHoFMERW0iMBBobygywDlPMNVprpVaf6iLdaAyMx8RXM+THQcbHA6VOPrB
         qk1tU9OycY/NLpKENF3iW6hkZq9qNWUTU41WVi2w9h9HJDaJwf9QAwUBcYtkMbcB7aYl
         7rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147476; x=1795752276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
        b=1oQ62jga+F3tUYIjFC11dzzA862+t0fvl1U8shScyNlp4RfT9PBH6/FvkxHiRiJpaw
         FDDvBCDXJm3nkiKFaLpiMtWxHLccI6fEUl1csT69yHRd/NTYrTUNGpv+N3ekaO9hZ/S9
         wcuQhwSUquWSS29RvP/BWYhr1oj264VZAF9BqvmUU0ZWXRI0o3QE972Xc+WnpfkaDr6g
         +eAKpvpm/1lROBPnXLf/HTmnZDwMaaWpy/iskxr6sQqO9veUZNQ4KWuqnzr7J96u2yOf
         ZpXJTvTr6ic2tn+O7bTk9nHk1vXkegOY7k5r9xtimhqHvX2n0/SH+KrR2R44imN0a+vK
         vwZg==
X-Forwarded-Encrypted: i=1; AL+hErFIhxbCDCw74aPjX3ID3L9d2oC27Nu283/YsxZC7/eLszhame+kNU/p2Dav6t3ypHkMjZKS0wGKwO1gppw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ami/YZC8y+DMEULU6YC3z617mmbq8nmbLgkgdnYehrtvbQHEk
	bGA6AamANfFMoEZkiwWMxkQHMhSy7rWrPSk8fULpGBCUku71E1s6ifvO
X-Gm-Gg: AZFdTZd8wA2dqLnfERbzVTT3NJ4IpYAw2vMiTAOw6u4l+uWARH89hEq71hMBomSEZGN
	IH2r8r8H8lZFXclWjZuargZO/zkngQFpa4Bh2fmWUVZXXlmuhj7xypYrt1OTBhRe+JULkG/ifpo
	EkUf0cPgJlRgxJlPKZfW/VmtJu4gJ2RbsGmUtrZx3P3uJiwjnVzwtYSmqDFyWsS822IGn/4HoB2
	MC8tWiwJOMQiS5iZkRrN8C5gvkMOVB8aqyG2v+shsN10aM9NPN5iag1ItDw5uG6aPHVA1QSYXnf
	Piv/tLzdeWSfAs/dEVQM2loznvQ9nIvEklm2k3TwM8OHsJ3QKvvg0tBHGh55SFuupNg0EoBMWgL
	VAbrHSQa3HotRRqOOCtn2nKTf0FAp6G/G0vejOlSq+0S/2cwn1+wtKkJp3tJC888qZ/bnVkHSTi
	GsCRAxu48vAfG5/IQMGWr1gygIFKmMtzSaXNaEFK+LGcvtfErKoD32aAmH1m1nod2Gp3sZ3tPSu
	4+siY0LT3ujAVDwikLbr0RHn+augAyf/SCHnd0iIlOISk4LebsWpxp8Ndgc8WFrwdbO+UxLaEBR
	B6TbpsjwJB823HP/1MVJghc6HPhXI8RUNQ==
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr1332465eec.6.1795147475927;
        Thu, 19 Nov 2026 20:04:35 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:04:35 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 16/19] powerpc/pseries: Disable context analysis for the CMM hotplug notifier
Date: Fri, 20 Nov 2026 09:33:15 +0530
Message-Id: <b898fdccf40809f4d18aa302ee3feabe27b89151.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

