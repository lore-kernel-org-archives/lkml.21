Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978976;
	b=engbAeFnPHdPCEP7xTneGllFRJ1ljTvVmEG9S6IA9acnW3/mdXbgPmX7TIvDk/2sB5Fk
	 8OW98kADxf7jndMANDipOI+dvj7lTCkiW69XN9OgT8JtR8aNpV4xIXQXbRXCDgirORXYB
	 8Vk0sHuophbAnUhrLti81V67OiNvL0YgKxVAcd2gsDwKZHzG8OMWszRaNhcxILL0x3g5T
	 D9gLD4ZeKG3X+ZyOp0lXBze+84ZtQdxEQwUvWYxfwdfPAQQL/CC+lVdyIIny3L0cO/bu+
	 x71b1eOGuaNd7mc4QXiJlTEJFhdoF9ddB5WfTrS1ObipXIIhYmqZ6XZDyfi14pw2jBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cuyjjq/ADVaIP+GusU/9yT03ulOQTHuNU1ExsSSvRD8=;
	b=2M7ixOsLa9+ft6fcshuuedFKi952mHNSrJ7rKLrW96WnWfKb1EjlxMSu5rhmwWwK0XSM
	 HiZq827c6dr0vNmp/thV6RvsGQ13iCsq4epmlgNQ3ENol7gt6uHAZQHgqKIONaJWAyC1G
	 JXcmltQiXSdKui/UiSuqFXgwoKkl25XgJ14ljy1Pah4lHvtVtIJTCE2wJDw3Y9CRhhLOr
	 ewPH0FnQ/DIwYHTqw9HXLS6q7i9W9uhY8iASBWVy+JSF9STvxLo1AOKxsNuhUXPmdpHzA
	 On5u+1nsJ97O4+nOMKPURkAnCpCyggcJuNGz990HDp9MSIozIxxbe/ezXMhZUwyzFtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SG/8DsSq";
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SG/8DsSq
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53634b8328eso5574921cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978975; x=1795583775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cuyjjq/ADVaIP+GusU/9yT03ulOQTHuNU1ExsSSvRD8=;
        b=SG/8DsSqETvEmF4qRmOh9P28vfXZa0KtBi/jIMMS8TNPNQj44lJVLve4dEBymyATb1
         47fEzl+7XpzsTht+9AlzKOgvYzoXzNY+jlUZbFJuehjkACig3NBrQVTN7yCw9UPujWEk
         SzGdWmCDdL7w3hzmztrOU2d4A26Qhd5jfvhjDAKVW4oT9yUAKPt3L2RzgqxT+ahJ8eXU
         vDRbUU0HtFNebdeXhKvR+dTULEbsjfBiy0ANvCb4iqDJkY0qMPr2GV2+hQYnPJRl1fej
         /4v2k0eNdwdJ1zaRld8D1RBAd36g1wBmvYh/f9bqgbXHMjC4usT2T0EOERhHuUfbgfQk
         urYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978975; x=1795583775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cuyjjq/ADVaIP+GusU/9yT03ulOQTHuNU1ExsSSvRD8=;
        b=DcIvYcz2PCcNphfbV5lhNp76wQkMeILExLPRd2jkWd2ci0DEd9+cirNImKDYVSRsqc
         cjOGDhDbapabp+Jyz32emoI7n0jX6pQh3/kAxmd/XPb6mc1DpuVmSaBYgqZEFs5Are3/
         GO9i3V79i3WcQTJKFTKiCbjFStIdJu11AFmTJqQqK905+JnmsdbocZRL8PFaMb1qnOen
         EukrNny7eRtRDw/bhMYuFGC+Y4mmradDNrCANDkjLCb1zxO5F7xsEeHApGFJAni8U9o3
         Md9XDl7rt1qYO0d1ZYhTznPAjC30P7aCLODzudWhQJMmOi5KSy12VZgHxF6qCH4Rfp5P
         kC9A==
X-Forwarded-Encrypted: i=1; AL+hErG9ihvWVDJlzd9n10cWQMqurXJs+5COse4g8JrIVsb7aU5HeA7w7Swe6jQrdzrrGiwsm5qUV1E2+OXMkyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hQS0ZNYz0uqPGsxWaRKSpeXcmq7iCR4HXA85UxCmQo+mGWn38
	zqO7PW3yMTmP1novF9sA7QLwOz4SkdKGf0ETbMC8SgOiUn69m1zAAbJV
X-Gm-Gg: AYBFou0KPbb6zx4SHv1VyXYL7K+dBzTNiIfQSGjTVYuIrr4Wkgguadaql2WzENgHLC7
	uk+JHv+GmliRnZl2fXwKXyeOOd5oLp7rOQhHejrQhqPzCWKpZDbBsl4gYZVuDshKv1qQzWcgwdf
	cFOmBKvG1vejhn0pf7TvBIoGlX2w6yxiJjTp2/U0HA6QXyQWeXGu32FC5+57VUyyZef2tshGZeN
	w9I5A6oCYOxE3eVUQvs/SguoUBOqpnlTTtE7Ppl9GNaLcjODSA7w6e/Fzm78OpUHZThWJGUkT+u
	7hwzoGxAZCp/Zp9qboSMAhQKqJbJDwMg0Df6pZlBQ2K3iEPiLLYByCI7Vza/I6CY/K9L8TuL4cT
	ZQytMmizTH8krDy9yYvoQ68W1Wox/EYb5Mb3+213jT7uCDYdaWgoNjZurHNNMV3/l4N30HtQTRy
	T2x8GesZ1+a9I+ihArbAjcw+d1sDqnJBkq19MaLfvSkzfECzJopLYy2dJoFMkLmzCWSbbogYJAX
	YK+z5jnscR/S+psfOatBABC6YieDtwT7i+trzKdWp1DAk0X1gukzB//4M9a/aF1BY+w/72GWhc8
	/eoxJRFa02/kLARVb5RcmA939wo5PdgzuSx7xYEO9FOAxaMJ/LtF/H4lNK1MysjKhASelskJyyn
	u
X-Received: by 2002:a05:622a:307:b0:536:64fd:7b5c with SMTP id d75a77b69052e-55d5a785e9amr25107371cf.58.1794978974791;
        Tue, 17 Nov 2026 21:16:14 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f4f5dsm12799576d6.2.2026.11.17.21.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:16:14 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Joshua Hay <joshua.a.hay@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] idpf: free the RDMA auxiliary device ID after deleting the device
Date: Wed, 18 Nov 2026 00:16:11 -0500
Message-ID: <20261118051611.3892489-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

idpf_unplug_aux_dev() returns the ID to idpf_idc_ida before
auxiliary_device_delete() removes the device. If another idpf device
plugs an RDMA auxiliary device in between, it can get the same ID, and
its auxiliary_device_add() fails with -EEXIST because the old
"idpf.<vendor>.rdma.core.<id>" or "idpf.<vendor>.rdma.vdev.<id>" device
is still registered. RDMA is then not set up on that device.

Free the ID after auxiliary_device_delete(). It still has to be freed
before auxiliary_device_uninit(), whose release callback frees adev.

Fixes: 65637c3a1811 ("idpf: fix UAF in RDMA core aux dev deinitialization")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus IDPF and W=1.

 drivers/net/ethernet/intel/idpf/idpf_idc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_idc.c b/drivers/net/ethernet/intel/idpf/idpf_idc.c
index b6cd1c25ae5d..9d3c55854477 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_idc.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_idc.c
@@ -253,9 +253,8 @@ static void idpf_unplug_aux_dev(struct auxiliary_device *adev)
 	if (!adev)
 		return;
 
-	ida_free(&idpf_idc_ida, adev->id);
-
 	auxiliary_device_delete(adev);
+	ida_free(&idpf_idc_ida, adev->id);
 	auxiliary_device_uninit(adev);
 }
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

