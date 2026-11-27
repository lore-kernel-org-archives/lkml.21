Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753969;
	b=0z5qVdv6mhZiN5JG5MnSHwm+I+fEVyIvxnNwpDDXTz+hZnY7gAioiNCmsFoFjYIEgAy+
	 OAzaqnPn/DGvCN2j6LysUqNaG52aB1QoQu+g8vYWtVsOn4JEHkDV16lz5uSbY94wBj3IJ
	 0w7c2A4qUjNrjn+lWLPTzXXBpBhHg+Lww+YphT4SRjLlNJWyM+LR/CVuPebLi0dN6tkLr
	 VLgYXPBAJXafEYExfj0Nt2BIijpV0YNAuW81oGVlA+Wd99sjkYGmRxLFNa0fxpnReA1yj
	 5q1jH16EBV10avwuK6VTk3hP/Q2BdcX1FaXZy/7VtAmLkbzmCkOWKeKHUgZWHlP6E6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9wan7/G8S4UB5GznKJoS+f2YKxQ4KsBioj9oqflOV7o=;
	b=t+aE2MvVFtIgTwPxLHayla19RH9gP+LijsPWnB3Z7k453EdVzTx9qgw96IFsJ9MSCH2R
	 5Qvoo5RwFUsRWBMGFGWbsayB34s2Hd0CA8iQjF1BkGYfXO4inTXITuX8CAm3pJO2J8PRY
	 IZTVyPdlN9ja01q2EuPnkBtcAToCu7zLMdzMxdnll72Eo4GPqgK5xsQ+wZ2Nmyp/1/kjx
	 FwOe9G8eXFXhmr68A6QUDSeCrfm9W1JrvMu9yu/yUSODxini8j9enQmBYHBFjGuxKtM3H
	 drSer9k7Ju3MM1vmvn3jswy37JW/d2frbjpxGpg7T7e2rT5LHiL8IOnadPNBW4zgNSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TA0Xf/52";
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45132606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45132606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TA0Xf/52
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so4577260b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753969; x=1796358769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wan7/G8S4UB5GznKJoS+f2YKxQ4KsBioj9oqflOV7o=;
        b=TA0Xf/526I4RQgqo925fVLv2MqNnBpADfW9+sve7dvu/s7PRVUY6H7yR53MDHiVHSA
         cnHrMvfH8KMiZYoJGA7hHW66vWMscRDFzgzpLSztD719/fDXSxcJ+bKTlAT/selsGfnM
         lsrovSZMBCOOspDUJLPruCI9ODTKdHVuTgcvB/LmBhETkAV3/Fm6Jqoh26F3XU7fZVzR
         Hjt4+9tYQaosnWHt3g7jb6s63+seEHoheOZlg+4u7MAvDuC4g5ueOY3YrsE7j+vxi8Qi
         dqKoalApYqfB2+h5S4W2jMitS0v2V3+Z+9MFAIxFRkuRSewJ0sMQ2df9bdYSopaBBgJa
         BXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753969; x=1796358769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wan7/G8S4UB5GznKJoS+f2YKxQ4KsBioj9oqflOV7o=;
        b=Jgt1cpzVez8EuvnhM0aUMGOMzvuR9DEOptCNh1GNzYtZxFgngT8VA6qtqNSrNSDhvO
         R8EDVbDt5quRN4dk0mygTJCx76Hi2x3Cn8vf0KOBdkiC+rFAKmxv350qpfyKHUYxZq5c
         eJ51IN3Mskko7lHWEhzrbhqEezeLjPSme8Xsbg0onLlv1L/D/u/dY0u2ix4nM9u3piWJ
         WhCMCbhN0vHZDgZHGaE8Tbxipe94yIMT58+IU+2k2yCSWJXVxW3x4bTsD1mcIEAf4aTh
         PxnrfggB9oUsVCnjWR4ozOmOKuIfbqRSHG39Wm88UmgHaKejEX3owktskHGUkBkH4rt5
         KgzA==
X-Forwarded-Encrypted: i=1; AL+hErGhHHIwoYy1kw82tdT6mp3rqwuTQzELPbM3niXr2JqrMjecy0+JI8DWhfhAk36gWacWP3QCpU4kNGISGVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DH8bO1ELf79eD7ViBbuo3dycwMlnF19viIsmCYhA/RyS0jvLG
	fI0cpP9lFm0YqqpS8ymSYrK3K1My0UvCd5MQmFuxbNSrVjWxGEtAKVGr
X-Gm-Gg: AZFdTZep+NaAohwOlZDOm9aLV0T1rXSapNWBKfg1+cIoTSyLjqwYopCdttkx1vZJrJa
	2XzLG0NKosoHQWfJxfiNJntg8ms+Pa5GlOYFOPj4mKnaPXX4qlCu70PQpN0xYG8RT2JWbbJ8wp5
	1yjYhZh4au+WVuISVRN3R7uqdOjCizuUPA2zZYLqB0NP1egdHLF2aZRrdeqeZVH22ey+lAo7rKH
	wfXpSruMoR98GpKE9YlRS9+2HWoQyWhd4SSxskZjIIUP4DSqV9WyUM9xXNlVCHoEzYSBspMRfGT
	raHcnbGE83e0vliqd4r7U70ebnyaRX2ZhNpHhRE0IjBgH5LcvRLa72+VEqLVrdrJ5aB6reyM5hB
	bYEA6U1T5OyYb/BwvaRwxZqUFfr4gW+PGdtPC0HxbeThdXu/wriIm5by/EgfuUj60FBxykdHW27
	DV69YHlym1RmR5xsOfUWcEs1JAfUQdPSvG1cw9IihlDcc/Nmyi3dfemOy9VdY5XOIBRg/b6NsV1
	r/DWvEY1ZfGNL2n9vs8pVAEbx7OrS/WOfn93VLD1KJoOVDR8GX1SvTttrowE32j3HDw65hg+x6w
	mjdjsoYmVx0NbJLVnXGFmk7HOaTgne2BkDja7kYYWfkDEWcLRnq6fbje3FcocMqaS0+Pclk=
X-Received: by 2002:a05:6a00:c08a:20b0:8c7:f59c:e82e with SMTP id d2e1a72fcca58-8c7f59cee72mr12535360b3a.36.1795753968591;
        Thu, 26 Nov 2026 20:32:48 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm11468690b3a.26.2026.11.26.20.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:32:48 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 2/2] platform/x86: mxm-wmi: remove trailing whitespace
Date: Thu, 26 Nov 2026 22:32:45 -0600
Message-ID: <20261127043245.132189-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127043245.132189-1-artem122novak@gmail.com>
References: <20261127043245.132189-1-artem122novak@gmail.com>
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

Remove the trailing whitespace from the blank line in
mxm_wmi_call_mxds().

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/platform/x86/mxm-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mxm-wmi.c b/drivers/platform/x86/mxm-wmi.c
index dbc5e35ec38b..c9a3d1cac65a 100644
--- a/drivers/platform/x86/mxm-wmi.c
+++ b/drivers/platform/x86/mxm-wmi.c
@@ -46,7 +46,7 @@ int mxm_wmi_call_mxds(int adapter)
 
 	printk("mux switched %d\n", status);
 	return 0;
-			    
+
 }
 EXPORT_SYMBOL_GPL(mxm_wmi_call_mxds);
 
-- 
2.56.1

