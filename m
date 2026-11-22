Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375139;
	b=aUkWeflRm2O4+RJ6hcP1ShOMbEwNSqq9F5cDXZruGuI7T4ZLl/1YaQUroBQyhJY7XRAW
	 HvVI5O7RjD7UjyAA/lOLbmljk++YNPUC6QLkga/j62zuXY2F8z4rPrEBHuYnjq5wulKjs
	 pD4T+DjSVIZKp3g9THqdfwB7EkKDTj4XX4q2VM7paO2DxtdD+e3SYIUuP9Plgf3xexRPd
	 ZzZmyByB4YXnNKDebhEPnJLls+ZPC3FLkDAflP+gwh4S37vXw4YPRjFDLELN8pBxvZ7GN
	 bOR9fXafXSnDbWDcN1dKpgJlW/5aWLRvOpYjvbn1nYVm0m9DAlEJSeedtOYJeezGP7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
	b=siE8s/TYr/9HrN01OteBJduN/oEW1SEeoSlxki7htS/RwOkkJysm8XWY8I7+g8sv0Zbs
	 o4+TB2iT4eUjtr3tNRga2OkOAhTaosZE0jHIbI3Xc945poly3PvmU5P9uH2PI3kXNp1vS
	 64pDNTysMFw2FcvDxHKzAw1CMOm5eqF29K9xJZWIMSV1D0ngXapb64cT+hXdmQBJ5lc0x
	 bgWuL8oBSvyb8S0jfTGZJCsmsIYL0xWEwmmxE5kryV0F4LQ/oCijmwYoaIKGCHtHI0sF+
	 yRHMLUSSMom2RSEsHwkSO3Mci/EDMxN2HWDMWKkp7Ag7xtXqFuwL9il8yUvbahe1tbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3UjBH3C;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF76606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3UjBH3C
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso18813595e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375137; x=1795979937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=O3UjBH3CmNWhcmGEJhbSQHkXs5PNu0jtbxwsuPUdWbYk7HhTLqUQCZVRasMZgp1kjv
         KSBaZEyIvEJ4mxlaMSVnEuZf+DLpxMU/XKVPPkZfy1Y35+CnkvifWZf8TqhkE4zGEJk9
         R5ieUAlv4aqfeP+ncJ1fIhK0aCwtizM756ibsGNChZmUkb0i63l00NI64vNo0akhcQpn
         i3CK4KrtHXExRUTQ2/xvOcxl6EDgLx5Z0wbUXODLYyx9OoPZMJ8oX4QI+gB9TumKtHpj
         XqmmkOxo8RVqcXnVO+JR/1tjk7vjPWNboEesTNetWxR7w5fjJwVkdrrBiSWUV+D14hc2
         h11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375137; x=1795979937;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=D6zODnk2kGLtOGLIIbtuEkxt+a9GO+xXrjC0RTBIUvpQfC7Cr+u3lc2dZAmYej6ggL
         cNvhp3Tutz1yHmBSO5v4m67cr5+K/3Vb3WMhvWwP7hK3kVHquBGdmSMHA93OcPkOZDUV
         DbuvqsJgdE+6YquiB4dlX6Lh3oVS1Y76/pwtrLuQ681rBrfVsToUA9WdH3/7Z2froWr+
         dkX8WyX3pvu4FGjSYUmQwTlR9wWYMRNQ+LLnSYF5rzwc0vOXVp+QvDbfscg+l5JUTdIX
         lRwtNvC1tEhpoBSlbFSNrcw7bNWV1utjlPzaF5A0hBVN1fFWApkck3g/4blZBQDwPUa/
         bdNQ==
X-Forwarded-Encrypted: i=1; AL+hErEOtP9d6XdE6GyOUGt8mMqdl5qjujXV9IfsqOSF/6xJi/44vNvbCI//pQ/1245vh9C+EBsoDpzDPu89OFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u3uiTwRVrwWtQAcbRZtZDfp/9j2KGqZgFD9m22K6uWtLKXfCC
	emtf7fyphpYdyhWyvriJVdaKbWSlPRAe4pRu/H7bG7cLtYt170fABCzJ
X-Gm-Gg: AZFdTZcdZMHz5TCNts0m9r3EwTjHs8xlubTmBsPVLVdU8ceL4GT88p9ZBKuK0SN1ZXX
	1j4hyE3wHHK0b0FxALpqWThN80n/Xbp6yfY+/0IFbitcUUeH6soVno+edecWPm7XMBSO94uuHdj
	WF2P3SAm9b/KxkCF6AF9kiB0dqlxQXyChK+6tHdjadEQ68tlxCqPm5DCNeZbcJy1n2Y7n83eBPE
	pzohALtvwhfulFiigdgZd5EWfg0xZ4k/k8a1kKxibyOFRfBJ7l6EE6EQO0zdx7+cXYzP1hrAJU9
	2D7KVvb2uAt8DvRvSKyIDv2EIHwIq/kpPAg6hJadpPDmwQ0cEUeC2IdrPsFhLN8lkXxIowA1Bab
	dQC04CIi7HneLk+Co8pvJLqkUckMH1Az+zjHUW5ql9SeOcnEdWbVt6OnZ7ESo5PcymngpUUwnWG
	JYjuiUnco4Jvd+7If8AT9q8KRTUDIVnpsJp2trKn/r2J2WwkKAiJasxv5WVeab0nlr1W108jGQn
	f+4FEqV3WBuKOJFrnpJLDds+EuQ1mXI3v0xdAA28IPP4tunCJip/w7cySrFNNCNQ+vbY8mqGzty
	O+myHPoy+HcBSWFwGl8JVQsaV+W76qRtXofjMJWbenLmDlmmIxVzy2jcvIoygCnFHg==
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr193493515e9.11.1795375137482;
        Sun, 22 Nov 2026 11:18:57 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm199176045e9.2.2026.11.22.11.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:57 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 1/7] riscv: dts: eswin: add reset generator for EIC7700 SoC
Date: Sun, 22 Nov 2026 19:18:55 +0000
Message-ID: <20261122191855.2183827-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-2-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-2-pinkesh.vaghela@einfochips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
