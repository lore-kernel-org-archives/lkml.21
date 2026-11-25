Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633670;
	b=GFIzyj5O0q3hwDHU7+b91f2DyywpehPBZM3ZSOwiCdlJQ524RFRgL5fT/fFlgpsCzp8Y
	 QA52EnCUJbSCnzKKRL49lBwDl6i1FrghLwlD42Mige380A86Vu62V6lWf7/E+M978257T
	 /4xNjFqxlS1c/Rlrpw7YWupn2ZU2yLhEFpI7WGJHEZxbBkGJQpd8zXUvbxTdCA9WAHCkd
	 aEYr0AEMb0Qb2dHaPkix0MFkk3Lf327325GVtC4hv333e2Cq/F65B5wOkdeOvSR+FfHF2
	 tug1Vizm1F/SN0uWyC0lBT4hip7XoYFOc6CHFmrPgOVnOnTFEUHmwvYiJDHYERa9hLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
	b=rE0AeeAphgfbAFb+dvxmDIjRNiaJHoZH5QLdVVdZAmLc5LADWDO5GkaZkLHF88ZLs8fb
	 0n8zKL3mGmnd9E2rOHJjymjWcNKPq3VbRulPU3BTr8IMXbVhHLL4FYu1jz7EoN+vgRShp
	 /3NpScDCEfeWfUI0l+0MIRV0hTipvNs4hhXSNQUVcC7qxBkbSvtqqMf5qbwltu4DgPtHo
	 gtrj8OLyugrikdrzHDrPeYNspqtYrdRQNDjJATRprwJdiqKed72JSopzzpQ8FoZOPkjtH
	 FJ7fGcIFOgjD5hy2d49LaTTmBn0/PwpE3SHK/7KWm1zKY6h/g8QdX41kmvPJ+u3dyfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x5RI60/M";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3E606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C3E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5RI60/M
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b24f4b15c4so2697769c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633669; x=1796238469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
        b=x5RI60/MzFExmOQJVqzH9dvtf9/5lpQ5aEuFTCyldPxwdRHMWReCZiM66m5mQevnOC
         24p9Ye7iBrEJ8KQK39KIzPq5dIHWgKtvq2ZnBi8cPgFm04uy38keKwpG5GvuzQ3bwyAJ
         6acVwshjCzHd4fvWMq1+0yts0TF4McBIGvmIpTZm1qKhUXf2AlOl83pNfwD4UonhQDzt
         qWqa49LV0UMkbStyt8cWxbbQkJvFqHvOd0x8gU43WRPJgfoSiqpcaDHeUO/Jt1Q1yCSx
         GDUaRHjSy5wfPzmETe/Ogh6STqW4g/OgRfIW7EXwK5iLBFw7Z56qh0wnalg7RdHrbaU2
         YTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633669; x=1796238469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
        b=FKW/u4Xy3S2iJCJyBQgFfkhmbQOw3/zFA8vE/tY4dXx0iVTvFOQMQtWYrCZ/jdfixw
         saxGOQTy0yqCMRjUVnesuhwZv0J3NFPJPoO0Cl5B77h3RNbhoVLpNengrW+ZayDruTsm
         LMvf4zy92mYW2Glrju8MZboMhuJeaMl/0Zvv6dgC5I1Qx6gHMlSt/0v3uvZKSlBYTpYs
         akkqWhj9s3iq6bTZp3krx9E+7813+kFAfCZkx9X6vqO9tbSlxbGu4M6SqTy/8b3Uy5Kq
         Ul9zgSMhtDBl098MnKbfOrcKGltVBY6a46ZfCadugcNJO6RcuBPkyJOgj/eGbyAVCwXS
         Zsdw==
X-Forwarded-Encrypted: i=1; AL+hErFo1qr4EE3S8Ct8piiB8m7b4hsNd3dOIPE4/bF5Cm0rELoE8w0o0RyuEBqX8c2qqToueRlSYkSqfIjKiOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u+YfZMYmawjR3jWFHItXFLinL8U/UqN1m96gTjVdaaGzy3Zui
	ujHvqxcMXFEcldq4rQ+gaJjFXX8yyJlOY2Yd3epQdnqXXtkvSFNH9q8M
X-Gm-Gg: AZFdTZfT4gqqoJ3DDyFkl0OsXenEw805YtrePS2LaasM2FlTOMAH9ATY//+LmiXChMx
	91OlunDAc8On9nhk9ekGhHKD+81vfstOj/VVAyiuSG+YcHmnOiqXcnOJjHyhsUKyxWTxRbt22Vf
	Ao6k647B+EdmAbok9baNwtvdLAZVawBpBDMzFZCfbByTKc1grWG3ka4KO8c4zMCvbDqF0MHEz2+
	RQPJRySrCB4rJZG4oSIS2d3X4JeBv/tfmrEEAKgLJz9k2qiE42azkSeBoMOQY0cCyHfeDRg7tXo
	V6sP3e/LAYljREkQqo9v63P+c96O7cvY62cu04KSyQfWQ0MHjll5urLQuxuoVsfgcCHYHfd+b4l
	jCO1nul5m1F0We7ANUst+ppZedLtHLtyzLpE1DnaIZmlOIYIpFHhizqtDIaglC6UKdEUFQWC1vV
	nChZcLWN4t5PWEzFmBbCIp/1beOFSJ9wvwv0As9NBqhu0eHk6wEGu+RusPMPEN9d9fcqGhJbQyM
	AQESoFPDvpaB3TNrdy3VaU5PrZQPDU/KdmR1qeWnGqzcP2hsRQH6/s3VGrqghm1xWIVxfQu9pib
	xz+mpQ7KTS3qmm0tuaxY
X-Received: by 2002:a05:701b:4213:10b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b5568aac8emr18988658c88.5.1795633668803;
        Wed, 25 Nov 2026 11:07:48 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:48 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/3] docs: ABI: hid-lenovo-go: Point one entry at the version group
Date: Wed, 25 Nov 2026 19:07:41 +0000
Message-ID: <20261125190742.2420486-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125190742.2420486-1-takano32@gmail.com>
References: <20261125190742.2420486-1-takano32@gmail.com>
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

The protocol version of the internal MCU is exposed through the
"version" attribute group, but two entries claim
right_handle/protocol_version: the one that describes the internal MCU
and the one that describes the right removable controller.

The "version" group has no entry at all.  Point the internal MCU entry
at version/protocol_version, which matches the description it already
carries and the group hid-lenovo-go.c puts it in:

  LEGO_DEVICE_ATTR_RO(version_protocol_mcu, "protocol_version",
                      USB_MCU, version);

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports right_handle/protocol_version twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..ed8d9a35b8ca 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -386,7 +386,7 @@ Description:	This displays the product version of the internal MCU.
 
 		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/version/protocol_version
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This displays the protocol version of the internal MCU.
-- 
2.53.0

