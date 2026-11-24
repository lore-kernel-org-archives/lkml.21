Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509005;
	b=3Mugca+kTYWvJqSdRoaQJsx0Z5I/1yBpzk+8n94idr0+iLVVWkcvLyUoQeqTXPdm6uap
	 r1w2bqHHZrsCxWK6YQ/fJ0hzh4vpeMjNUOYxr/w1xFrJU5zcwHlWRHH5RtgLccZEZYrjz
	 mthrn/0D9pg7KTZkqwHqf4NbSMYh2RzyvgfE3kiqM8RiG9S+IHUD6imR/8jQu/YmLaCBB
	 jJAxVBMEwxkjWkYfBiaLBBS7fSDAFo0R0LLnTXlW7Eui4u4t7VfIhMASJznD0lcUMnELj
	 AnXueFoMpSZDIFxBb/E74PBdiaKRBNNBRUopvxZjr0Y35zYQ59/k4sYbOSV9CVA19kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IBNeiDInf2XZfaw+tCW/m+hYWIo2VKvWt7JXlcpwDKM=;
	b=t4LergREtRZNWiBXVtunX8jmzJ+eyq8pAB67R9U4TGxxVHgAzllgRRYTcH0h0WJDDZ4a
	 k1bWnSqzD48vcEJWnuVi4FiOobEIdkvcKsOoa9YDliGrgOcN2aBaN/18eVFecBl/c5Mz1
	 p1TA7Eqt1z4SuNTJ0F9+LkX0dGKenclEoXLbE99/+CAN0UTzTXOh1qifAKjxtq6Fshu+r
	 UL3y6PRlySASwT27fPmnWdJuPgfIxP87C+PCUNOR+MhL09WdJTTq35fWyAx/gzEXD5uzi
	 auen+MbpQrSG+pORD190zarwemM0LzO9kQis9EAS2ci5SzbchKMz2PKc9EkMF4pqWJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsPifyL4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F56606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F56606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsPifyL4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so26855055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509003; x=1796113803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IBNeiDInf2XZfaw+tCW/m+hYWIo2VKvWt7JXlcpwDKM=;
        b=nsPifyL4FiZYl64xChMnkr9VF7NGfwkYEEJgQ84XaK8f0dyfejaOyHF1pe8t4qrmhv
         gejfufw+enkHlnn2ajkuG+7Ba0Ql7kOh7nHEHFBEc/Xt2zItXydET+df6WNacP7ZaQ7T
         2kSFa7vCEG335PByvGpgRje486tgyoxue4NyrKYUalAfQWBg6PV6nY0aFKxdaruLcsh9
         R2aKe/AX/lng2wCXrrmOR0hv0XcXBFyjFaN75OWsY2Gy3x5fYY41KVuFYsy+l7TvSSco
         WIDw78Z4fmKhzOYgl0sdnVtqiZj1+Age1e7iOnjI9truyeo7c9AAVg+wKddeENuACpCg
         EdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509003; x=1796113803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBNeiDInf2XZfaw+tCW/m+hYWIo2VKvWt7JXlcpwDKM=;
        b=Kml3vResqByBylX8nEveQcwCG4+UvkHazpWqcQ2cfeHdTN81lTPwDUUAVfQuW+Qu7P
         7QLXwB9seAPU3mha910bxNudAR6qbNCaMCshbP5i/J3NYVaeyyZXXt074iHAeQgVCl0k
         TOi9/MQhteGpfcutDqjHFSLCJjWDSvAMhPs3e4uwOzTEg29fIN+lIhPIm9J8R5GF80Op
         hJY8i1eoC3aLOMDmKWZYMLlVpju0MC9aSFKpaTNOHR0OYdWfnpGxJiX2AvrpDjs8mKHF
         Vwp/x70Hmudj395nEvgDXt53di/KXA+/D3Z4yC1toWLn3A+aH3dQfgHn0gh+2Qbw24HD
         S1Gw==
X-Forwarded-Encrypted: i=1; AL+hErEHjehAgl5RCYEDCasW4KZrOoHBFxm/kDM6dUquP7o9tRxAcF0Ov/buMjcRGWnTOU7hrD8lASRFb6vhVO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SjcIX3iP1aEiyH9HCwp/BXlhnWKH1xeIuns8RHLlUqcjYmetE
	/OGKAP4vy7BieFzhcjB7SRs5GGCZgXg3btFHIevz8+KVbGnXkdvS+qnvzawHCz6v
X-Gm-Gg: AZFdTZcOMO6n3qh+RgRD6iI67r4uUN2qoDIrrq4t0KSLRIMpfR5HLegum6QRvdr6TlF
	+tNcITDt4s12+h7P7x7a1hxS68v7VCM4Nd5OOKBuJIL8DHX70kggxh+XmtUTNLsNWi+Pkqa5xvS
	3i1DSE9gm4LHe7+B57XpyDpSOYwIEBjcZnMQUIBkqOIK+ocvwmejXg1JisYHKuhahbQxxlAjvB3
	JUBaQGxJQyBV2M01/XJ8NT80d8zbUXemkdTOv5lbaC1VMgJff9hsGDBfKEE/DS9Z+tLkAsxizVI
	MdfTSK8KbtLL/8sJNhllGmO9IFNg3N6jms3xWelwOEAwWTRhu7aT89ZgOlons+dKFeD8VLDbiji
	FXQLa+Ct6wtXA+6yI96xhQDesSvTVexsxj3G0xU+kAPgbt18uIxLUU5cjE56apWfh8mZmCaTp4A
	U5BgCArcb5NFVm0/6ZNyi2Z3yfMqwEAaSuoXCHQ3Oe76KXFURGqJcNuSEp/sPwr/mUfA3KAoOOd
	LvbJGwWnXFm356LsoIIjWn3IoujQ0PGpY563ZskOb7JxGsp3zz58bXIh7PZLiWL2J7QEC6V3oyu
	AreHzR7ebnsZwTA3QYSjXK+NTi8++mohNQ==
X-Received: by 2002:a05:600d:12:b0:4bb:8143:e182 with SMTP id 5b1f17b1804b1-4bb88800168mr219795415e9.5.1795509003269;
        Tue, 24 Nov 2026 00:30:03 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:4770:2100:e193:fb53:48c4:8a5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm26800074f8f.5.2026.11.24.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:30:02 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: akpm@linux-foundation.org
Cc: mcroce@microsoft.com,
	pmladek@suse.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] reboot: validate reboot CPU against the possible mask
Date: Tue, 24 Nov 2026 10:29:14 +0200
Message-ID: <20261124082914.564587-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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


reboot_setup() and cpu_store() compare CPU IDs with
num_possible_cpus(), which is a count rather than an upper bound.
With a sparse possible mask, this rejects valid CPUs and accepts
impossible IDs. reboot_setup() also narrows the parsed CPU number
to int before checking it, allowing large values to be truncated.

Validate against nr_cpu_ids and cpu_possible() in both interfaces.
Use simple_strtoull() and unsigned long long for the boot option,
so the value is not narrowed before validation on 32- or 64-bit
kernels. Preserve the comma-separated reboot= syntax.

Fixes: df5b0ab3e08a ("reboot: fix overflow parsing reboot cpu number")
Fixes: 2c622ed0eaa3 ("reboot: allow to specify reboot mode via sysfs")
Reported-by: Bradley Morgan <include@grrlz.net>
Link: https://lore.kernel.org/r/20260622154216.10064-1-include@grrlz.net
Suggested-by: Bradley Morgan <brads@mainlining.org>
Link: https://lore.kernel.org/r/D92156F5-5924-45CD-BCFE-AF385BDD15CF@mainlining.org
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

v2:
- apply Bradley Morgan's unsigned parsing review, widening to 64 bits
  for consistent behavior on 32- and 64-bit kernels

v1: https://lore.kernel.org/r/20261031060602.2949895-2-thnkslprpt@gmail.com

 kernel/reboot.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9a84401adde5..f57b9aaef3f0 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -1144,12 +1144,11 @@ static int __init reboot_setup(char *str)
 			str += str[1] == 'm' && str[2] == 'p' ? 3 : 1;
 
 			if (isdigit(str[0])) {
-				int cpu = simple_strtoul(str, NULL, 0);
+				unsigned long long cpu = simple_strtoull(str, NULL, 0);
 
-				if (cpu >= num_possible_cpus()) {
-					pr_err("Ignoring the CPU number in reboot= option. "
-					"CPU %d exceeds possible cpu number %d\n",
-					cpu, num_possible_cpus());
+				if (cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
+					pr_err("Ignoring invalid CPU %llu in reboot= option\n",
+					       cpu);
 					break;
 				}
 				reboot_cpu = cpu;
@@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (rc)
 		return rc;
 
-	if (cpunum >= num_possible_cpus())
+	if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))
 		return -ERANGE;
 
 	reboot_default = 0;

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
