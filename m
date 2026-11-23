Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446164;
	b=iHO+jxN6EWDZboymKj5nV2M5HBO0lEMwBOJ5TlIDDkTM0Natk+n5aMFJxbjycPlFrbYq
	 MqZLVD2RPk+9HZX0CYrW7R+tjgvNpxIZMY5W0lo3asVBGmW8B5AGDFrPXd6opIx+r1imA
	 RIChKrdu3ek1BTwOHm4B38V7T4vY29lTW2JLgngI64eGsScno/zQstpz3rkK14lnJFsVS
	 Cxen0MBvt27OaMghurwmmSzkpArgaBWMFHi2eG2j79IfUjoOsBjY2EPIVdlQy4yLEphGu
	 4CHRexMc92CpseGwhw4kVISGGJjP6ai01oJFBmSlvZytMAWcixN7BkuOwlLONNNzTyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
	b=efqij14OJYE6jgHrSYUWrn0Ohog+gGzQa4ZSkFsbx0WS/YoGuBdUKvwbmrptnYD8rIt3
	 +6vy6UANTd0rlZKRE51XDmMKtkV65hrkmwKrnp77xgLRKDoJyAukpzLSjERiDbQPgU5tI
	 Az4ujIQw+lxplbnq9hYj04a5WqrNxkwbSYuf2W7bSjIOqS4Frz/o8Z5xupcFLb5zEdzbC
	 0tPtSgUZWK6tkkfiWO7/F3naF8tWF+n1nkrZId2DR23x/1ysncj/qF9J2tKBmVNMQxpkq
	 wvZFslD3n/fTN78EL2Ve++UOCJXsZe+5reKdtPil+CD8OfmwZOxMw6X5T9w8EM+jxCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RX47pmgS;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CDC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RX47pmgS
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51373ae637so515349366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446162; x=1796050962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
        b=RX47pmgS6eAVp4IDiHSKFNIwzGNgVcBON8YEC3wo//o622kCQM3IeN5IuUOW5hjPzl
         GXbJ9SaVBehL2PXBdBdHrolbxf29Wn/fBJAsHrS42/jb6vpOyebIsFJfn8+x83gFNzKu
         k6PjWzTqsAonLARjKwB0E0Wk51s9IL/xgU07B6xwO3rEzy7xDaxZbPSPGASkdoBEWcoI
         Jbeh3D4TXoLi+nBGtp30LKmYh4H38s9Hxzv15C9Hzm+zX1/lkDwQ8VRhw44NUbjTHmhq
         CpjYxt2BAKB3qMzYKeqEITZqQSRdNrlgG9GKLU2/O+kIeCfyV5SoFGZqRCHeVOOGabau
         YCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446162; x=1796050962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfZsZ4QikXFqFqBCPSrLqvcJjVdMXTA7lYQIKPsnGiA=;
        b=T70uCuJ/fP08fp3FXYMXSvrNNO9PKFHvuaEexVJ2Jh1yUDjVi7QdNrD2CjE9Si1x4s
         mCOUEHLdObx7Vton1PoO7Yg6/2t2C6a3yxez90agp+80rXP3J+kTHZcRFvGWxihWUiPY
         fxLqEAg/jN+UlYKgqV1mWsnOk2G7DEnBBcZHgfd4jdKdRhCXHy4OIsdH197WOUmgiNnq
         RWk0b+LqYpyXzvvvzoxxaNXndxOADqJvMTWUSDXMwk9HJjHLjMWucFuI+MOgyjuA3Saf
         0nyl5M8+rNS0E4dIlbelOtBvxIxWqXgPq05K9yBq7FFeWasmUpcO33HaX49jIXY1lpck
         kEEQ==
X-Gm-Message-State: APuU4Z9THvl+KswJ58J8b+gQvkTj3KGpRrbbV26wiGvMWUQUFMDuQSNf
	6zqeFJebMnmDft4uhKEwfRmifwmsJ+KY48asoIA6NYGWLP6MnrQ3WHUv
X-Gm-Gg: AZFdTZebVfb4RffiPS61bfPAuyGBt42bRK9yLOIYA6VTCJEQMl7epWni/wfmMjdnnlp
	HmsY09dLXlF2lil3k5Tuesy2QleI8D94tnalQtQtWHKFfFmc95K2PvA6TdGN3QujlH3viWYTA8A
	soml7F/IOIRjwQ6AGqONuyQHpowBA82JRE0NA6dDFBeIL60HoQnwXqfrcjxeC+Yvb7a4KEePFu7
	k/ByX8nWDxGfpCEoM5JEedcO/FTmapiEhKMNuYmMUbWa4Bid/ApOmBzwAhZtlyxlIi+VmrYsDUY
	fQB+dcb3GZERT/mSpDQG9bNLrEaLA7GL8/UK0kKK42ufvgX8YRO/2JnNOKEOjt3WTObYAYdnNua
	WU6ejzDh30hruItLyxIwE7r4dEUwFpSQG8cWcTFMUxwtUZu3zvEsIXbfd2sj8PXZ93HUlFjjAoP
	SKzSEWrlZFtlKR+7OzB/SyglbxA2fz5MzMTRhYpVEIceJURWoMzWOTYWq/1YlZZNAyTUvVCwZjH
	fT/Czi4eTbws7VEGkWNpZIfZ60f1m5J5IYrT2okVMx57Zj/Oql8EytLFet5fQAfoDxmqVHZ91x3
	/kZXiCCSluuw4qNks7+UW6IkImSoEQxfrAfyQ6BaxVFrPxLwWDStg/esP4OipiY3sZJ/HvyWxNu
	AR9auuzjUUQ==
X-Received: by 2002:a17:907:f447:b0:c51:3b74:9d07 with SMTP id a640c23a62f3a-c513b74a25fmr971881966b.18.1795446162362;
        Mon, 23 Nov 2026 07:02:42 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 0/5] mfd: max8907: Schema, pdata and poweroff
Date: Mon, 23 Nov 2026 17:02:19 +0200
Message-ID: <20261123150224.199601-1-clamor95@gmail.com>
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

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.
Add restsrt handler.

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()

Changes in v4:
- dropped in-supply type definitions in schema

Changes in v5:
- rebased to be applicable on top of devm_kzalloc_obj conversion
- added restart handler

Changes in v6:
- rebased on top of latest next
- resolved conflict with Lee commit
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 168 ++++-------
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   6 +-
 5 files changed, 349 insertions(+), 185 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

