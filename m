Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160043;
	b=ffXZc5R1dIpUUXP254zH2TnUNKbccpKxVzGMQ88bJk559TXbDnYUzmikzFCbWQJUIYZz
	 ekrZF8WtWymVU60R3/qVq0pghQdv7VkRbYpyoxAa/JYLni51OV6Q7hzHfSCU3gMqvyIqi
	 Bu/vizGmu7c5+7pKyXo8+4h68q1a/KKFn/otuik7ir5mLVsTwJtI0E3Cg+ABsLn0dlGA7
	 vcDfmHI5EExE1GGhAPKMCAmCT7LxYL/6xeVv7y9OBcfoHXxS79W9U0jgQBy4vx9wne3sP
	 EfYONKt/m5VEvUqSDrNnbYCz83OFM7rNaRidO/W/uFRPALtO3PZ+IMTTDVcv/9cVOYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2dmjNDN0Io3H696USfP/J2hOzQK1CyrceenVjfxqDUM=;
	b=Ccoz1aGigE89lOT2SZ/ujfjpDYKpeSwYwdVpWP5m/ryQy/XslCuaWRM//RabQaSsB20G
	 6RNorIize6O+g3bzAXJy04PMHwvePWEq1CCAjvw8ADblWwtbMcXZcapzN6AoIealWFh9y
	 F3v/TTA0i7BvZRUUMK7gneaLh9hUNs9nBR8SBlhTuWcrFCB8s2ZgUWzGvyZkCOoUs07fW
	 N33Azz9J8ETqE3zDRI/mnVlcQPnbhgwlJWNscbuxhY0HARSW9SHiNi6Es0czVUeTjZ0c3
	 tt4IfUkYcby3ZWXYHPDq1DMIcRTUZTvo36WkzRDdJdO5M9gBuNCfdu9BqBofBYUzoGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EI6YcmBs;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743760A2614
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2743760A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EI6YcmBs
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so1810805e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160040; x=1795764840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2dmjNDN0Io3H696USfP/J2hOzQK1CyrceenVjfxqDUM=;
        b=EI6YcmBs/SJAP/PMzNH5nIgd91UJ8s6teAoJ7aLIXG/zvpjwZG8MCXdf2NElFNbbPm
         Mad8sQWLsaiReBi+maiFxEqA0IRsGVmhPE3LHFamiZKQdWptX6kKQijP6+V3xQBLT4WS
         6n5oFgikC7UpScXdp0zHTvVt8l95wacBiP3hkqunWUsyaGVz5dux5eqS9KAzg5glzS+U
         WVaD9AOxd2QveT1N7G3Liy/mLPjXyy7vz9oD6JsQeXJAThwAG4Gcygl4yfo4jO4ozrC4
         KJPGqog1D8E0ZBb/uVo2lZmIg6L0fqQzpcmc0Fhi/2uEDqe2IWTTUTdXu1FfTrIJ0+NV
         QXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160040; x=1795764840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dmjNDN0Io3H696USfP/J2hOzQK1CyrceenVjfxqDUM=;
        b=gzviidrH6tsGNUM7V04aVCd3IiM5Ph0WlrWomSu5Zcz6nfPGKx+5xe8zD4dMJRlSdR
         vqfXl8qPgWD4fSGBOEhooTexXnmS2uy9/HqEpIG0Lo6BgWZszF/uHwkKIE77kXgNOU53
         md4awTYoPhlUlqt0SRomUdHpiqnFwyd2EGTH2yrFnOtybrsMGQQnKtJx4ZStsk4qUNUE
         d1smrzE7qDaFtsIT1KjCc8d6bH8SL/X4HdathX6vTjnFv+/Y1GfxHfvohNv6R27icJ0m
         2nFnGRQbqYqVVxzb7GDNuqWm37l3Y3al00SjzIvAJBrhHRuJr9k+StsKgLN5/ORbVNmK
         7hgQ==
X-Forwarded-Encrypted: i=1; AL+hErG2JRS2QEDIPOS45mARnSEGR8Y3wHsRBsAmqwGrnFQastaEhyHL5iC9UpgPFPZCiy8ugWcvbVjihomlUUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qZzZWqi7wN7hFk6CAvm/Hx1ZvtEK5ML7A/1WCuPZ6v2aDGCvD
	hEFDpAAXwguUkPdB9zyEoRlaoUtXBqscY8KL92JqqHF4oXlMk3Dgb7Cr
X-Gm-Gg: AYBFou3w3wsSHEOpjA3FSE6JLzFGKHFauD9DOkod3S7JL+wzTdAkrcbn5i6IZ3/VwrD
	MTgg1wHXXdgTB1KIUlmVNskZ3EG+BXm8X0mS0ze12ptrkbaGjYu7XbYGXh3XRHOu8MXiwTeCJO8
	9pe7n64eHBxidIYPMzl+AIj1IRytJflSvGRiNYFnubdL/sf7z1cMsBjyhacuyXZnSbbWpvfSUCK
	kEe5K9Vn6U6D7E1W2izMVRTCwm8tlqfmSz7jNlye8IojtdQ5hH8qYwmHX2wQsnsQ1NFPbtS/tN5
	6WBBCkIziNe+VMVZbrfkdaXlrPDXOn0pPfaPgZ/E9Mi8cVcSOiuNCQzh+vJLY05nKMXz7OHTfpe
	uAxptfMGduEZ7VuBKJ5GLu5PWLK05loB9xNQ9oYxyWnbKSXrRjHhjW+BLi0y5K5KkgYxTufZxfw
	tut18PZXlNTlWCh56ZIZOR23yzIN49r8WEzwuNvll3O0gSVcl13B/5kqULrK2BrxBtQrUylSYeQ
	4REDoNw2I+L6BGcECrNDbJaAHckb4u0rg8SSl2/2a5msiUFlYbY3rH+NEyB89VYcU4muaD8MftB
	MrUBY6PaOnGrE2LQY9ur176ZZ4+shFcPDRF/CcBigL3eH83xybdOdC3s99yPkHheFf+2kR5ld2I
	=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr48162345e9.12.1795160040163;
        Thu, 19 Nov 2026 23:34:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:33:59 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 00/10] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Fri, 20 Nov 2026 08:33:48 +0100
Message-Id: <20261120073358.10267-1-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This series adds initial mainline device tree and driver support for the
Qualcomm SM8250-based LG V60 ThinQ 5G (timelm / LM-V600) smartphone.

Hardware features supported in this stage:
- Base board devicetree (sm8250-lg-timelm.dts)
- PM8150, PM8150B, PM8150L, and PM8009 PMICs and regulators
- UFS 3.0 storage and MicroSD card slot
- GPIO keys (Volume Down, Assistant) and PON keys (Power, Volume Up)
- Simple framebuffer (continuous splash handed off from bootloader)
- Adreno 650 GPU with GMU and zap shader
- LG SW43103 1080x2460 DSI command mode AMOLED panel with DSC
- Silicon Works SW42902 I2C touchscreen controller
- PM8150B USB Type-C controller in sink mode with USB-PD and
  orientation switch
- QCA6390 Bluetooth HCI controller on UART6

Changes in v4:
- Base Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Drop vendor brand prefix "Google" from the assistant key description
    per review feedback: rename google-assist-state to assist-state,
    google_assist_state to assist_state, and update label to "Assistant".

Changes in v3:
- Base Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Model PM8150L SMPS6 as top-level fixed regulator smpc6-regulator
    (0.88V) rather than in regulators-1, because PM8150L SMPS6 is an ARC
    level resource (ebi.lvl) and querying it via VRM causes
    rpmh_regulator_probe() to fail with -ENODEV.
  - Drop conflicting memory-region reference from framebuffer@9c000000 to
    prevent simple-framebuffer/simpledrm driver warning and mapping size
    mismatch with reserved memory.
  - Add board-specific firmware paths for CDSP
    (qcom/sm8250/LG/timelm/cdsp.mbn) and GPU ZAP shader
    (qcom/sm8250/LG/timelm/a650_zap.mbn).
  - Drop duplicate sdc2_sleep_state pin configuration from &tlmm (already
    defined in sm8250.dtsi) and redundant &pon { status = "okay"; }.
  - Adjust ramoops pmsg-size to 0x100000 (1MB, power-of-two) to prevent
    kernel round-down.
  - Drop unused <dt-bindings/phy/phy.h> header.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Fix potential unbalanced regulator disable in error and unbind paths
    by registering devm_add_action_or_reset() after sw42902_power_on()
    succeeds.
  - Guard sw42902_power_off() when suspended to avoid calling
    regulator_bulk_disable() while supplies are already turned off.

Changes in v2:
- General / DCO & Identity:
  - Replaced account handle "rofikkerneldev" with real name
    "Abdur Rofik <rofikcoga@gmail.com>" across all commit authors,
    Signed-off-by trailers, MAINTAINERS entries, and copyright headers
    per Documentation/process/submitting-patches.rst.
  - Replaced un-documented "lge" vendor prefix with documented "lg"
    prefix across devicetree bindings, compatible strings, and dts files.
- Devicetree bindings:
  - Added lg,timelm compatible in arm/qcom.yaml.
  - Added lg,sw43103 panel binding with enable-gpios and
    vddi/vpnl supplies.
  - Added lg,sw42902 touchscreen binding with vcl-supply and
    vdd-supply.
- Device Tree (arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts):
  - Renamed file to sm8250-lg-timelm.dts matching vendor prefix.
  - Reserved memory: folded cont_splash_mem and log regions into base dts;
    sorted all nodes by ascending unit-address.
  - Ramoops: adjusted size allocations ensuring panic dump space is kept.
  - Regulators: dropped unused LDO4 from PM8009 regulators-2 node,
    resolving the invalid 1.05V constraint failure.
  - USB QMP PHY: corrected swapped supplies (vdda-phy to 0.9V l18a_0p9,
    vdda-pll to 1.2V l9a_1p2).
  - GPU: enabled &gmu alongside &gpu to ensure MSM DRM component
    binding succeeds without -ENODEV in a6xx_gmu_init().
  - SDHC: added complete pinctrl states (sdc2_default_state,
    sdc2_sleep_state, sdc2_card_det_n) to &sdhc_2.
  - UFS: added regulator-allow-set-load and regulator-allowed-modes for
    dynamic load scaling.
  - Panel: added enable-gpios to panel@0 node; sorted display nodes
    alphabetically.
  - Touchscreen: used fixed regulators reg_ts_vcl and reg_ts_vdd for
    power supplies instead of raw GPIO toggles.
  - USB Type-C: replaced PDO_BATT with PDO_VAR(5000, 9000, 3000) to
    ensure valid 9V/3A PD sink requests without clamping to 600mA;
    added OF graph ports connecting DWC3 HS and SuperSpeed QMP PHY
    orientation switch.
  - Bluetooth: corrected QCA6390 PMU voltages by setting smps6 (0.95V)
    and smps8 (1.35V) constraints.
  - Cleaned up unused dt-bindings headers and enforced strict alphabetical
    ordering of all referenced label nodes.
- Panel driver (drivers/gpu/drm/panel/panel-lg-sw43103.c):
  - Removed redundant manual unprepare call in sw43103_remove().
  - Guarded sw43103_backlight_update_status() against execution when
    unprepared, avoiding unsynchronized DSI DCS writes.
  - Removed hardcoded full brightness writes in sw43103_enable().
  - Expanded Kconfig help paragraph to 4 lines.
- Touchscreen driver (drivers/input/touchscreen/sw42902.c):
  - Converted GPIO power controls to standard regulator bulk supplies
    (vcl and vdd).
  - Pre-scanned for palm touch reports before queueing MT slots.
  - Used named initializer in struct i2c_device_id table.
  - Followed input subsystem error naming conventions.
- MAINTAINERS:
  - Added entries for LG V60 ThinQ 5G, LG SW43103 panel driver, and
    Silicon Works SW42902 touchscreen driver in strict alphabetical
    order.

---

Abdur Rofik (10):
  dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
  arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
  dt-bindings: display: panel: add LG SW43103
  drm/panel: add LG SW43103 panel driver
  dt-bindings: input: touchscreen: add Silicon Works SW42902
  Input: touchscreen: add Silicon Works SW42902 support
  arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
  arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
  arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
  arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,sw43103.yaml    |  69 ++
 .../input/touchscreen/lg,sw42902.yaml         |  73 ++
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 815 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 587 +++++++++++++
 drivers/input/touchscreen/Kconfig             |  13 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 360 ++++++++
 12 files changed, 1953 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5
