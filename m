Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092362;
	b=xmqmGoC5rf9GhsvXBs/3rVNojN+knuOYVuhw8gCgYbpKwXt1BqGLNrQTvf9rJnA4oMF8
	 RZcwk1bo1CiXyM5VMFinrqVolSziLrG/yAqvA1hmTQH/MYIbHWa94yrknIKNm4+gOhOUh
	 3U5Y//fp1aPKptf7b1tTRyrPX5yOSLcMWV3QMDEg0EMqmul4dkazsRYNtuaFXSFuYvDkb
	 oOJB1JWDwsNrCKmqzXcmcMHlXGi/nW2h0tK/89JzQtitBAbezmIREBzwJ7zRPezgQp84d
	 ZUMs0E/bSzMAaHHOgC6eje1cMzhsM7D28XQ6KfwZa3eqE6QQ+EasYlF1MYTEOpX3PqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/vXmxDVSuxplVUUVYfnRL5cmVV8c8auAAYmf+pDAyHA=;
	b=Fmk/RTjLLXLumf26RxjGhiSMhwo7Y9v4qNS5DfjSxo6ZTpDtwUpshAhhkV/KdmqZLmg0
	 Dhmv2UNnAq1DaPcDPyN+GCxVhcqVpdHcPCPBIB1NO3TsLU+HHMfnUbDdGxVjiCLQ5N3xr
	 oUTmg+yZ1ydscj5N0s3+jyYIiuWOHVpKQ6FasUUcJaFCMDxy0XqEFvkifOtirULoMi6U0
	 ecM6nGe/x/MZqsoyNReFbDVf6BsWKWnTW1FBSMdqa6/iBNOO3V6h8TkwEUekfGyDG00rh
	 4J1beXrIJ5CyTp+FGGYIzn24vqhlV9Vd4EvIJWA3B7hkLY+B4JU+I6x0eKXzDrP3iog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Duv0s0LH;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190B4606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190B4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Duv0s0LH
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b546061d58so3823393c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092361; x=1795697161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vXmxDVSuxplVUUVYfnRL5cmVV8c8auAAYmf+pDAyHA=;
        b=Duv0s0LHI+TJP79LoK0fEyHo3WzKLqQMCUPqob/fKZsAyZfyr8EZMS9r/sQKPry51G
         hk94sqxWVsdcIH4wciNOGvVNM2/aUtEnDh/MkPgO9W6U4L1OpZww2waCgWGDo0ojLJzC
         AnAcYYzGVqUMooVloXxmg5wr7CFH0+SA9/Hr8ZoudsMtiZLmje+IZo4EviegV8QcYe8W
         /jsxz1SIf/2h6T8lXu5VHflkcVGdosUJi6Q3Aa6f+7TA38MVB8DASlwN16Iv3dpAF2a7
         6cBlAoWc6Wgv4z0uT8s12/UmacWiyU0KyOWPAS9kWhK6u76q4vUq7ZzBM1Vvi6MgwY64
         dFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092361; x=1795697161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vXmxDVSuxplVUUVYfnRL5cmVV8c8auAAYmf+pDAyHA=;
        b=e9eZ9PP2oXyftEUj4usTKRGA3mBUiMQFOPKOzhDWjXBVcLjicSh/eE1cNEGLVwSIV4
         XYr3sNq08j91cvCC0Ux9RM12dFmPw0Eg00IspvryftpU8Eu6hteNdruCRWJYNTPXTJOM
         Sb+rOiGaKEHwcN4IYKoNdI2z/3/7+vrLfpyaisNuiFs7beTAF2Dh/9JOrMqDPFtZrLbM
         DnTWubinq2zEPNfoTqL8+EWp8WGFCNiZZfcx8Q1ovnJ6pxLId/d4kM7gQFH2pQvco4Dr
         gFC2P+1R5cGqclafi+VsHdaRmy81kwQKghL/vwVTDE/KJ+XR+Gio7J9kcnmBSCoaSkkM
         z08w==
X-Forwarded-Encrypted: i=1; AL+hErFKJ+xE+57AozRu+WDFubRkCmW6PbLPFBdU3klN7kBYUrMBQxDDtyM4WU7qnlRkr/m6hB3MjhFXzILOPr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ie8OLgkyKY0xQk2Wt6Vt5yFNK5Acml1wEBZ8WcLHWOA5VLT7W
	1zamqksHS1uk29hHb8/daAKQw4JVatRcVe0BmBtVqhPTaMAjsSnCRcbu
X-Gm-Gg: AYBFou3VgJdtk5oOiZJczjkKEUiV/8QztUGmh2ns+rxujwof+L2BS8Zk1zsoJAOQ496
	GDzhcLDiccoIgVlXk4SBilq0OU0fhhRnF7Fz+tKe6YGn4KJAuYx3lxfMTJajp+6yFDXKPe4CPOD
	u5OtGKxpDu64IyQIRDSKo+q5TPZfHy0li7+W8viAWvY9OqowDmtg9YUlxka4M6odmkutEdz3VzS
	K/jvG9C3XjEiTOGylZMlWs5ButtfUaiMUomUIGpKIsrbHAM+3xRzNVo1ZpfDLfM+Xfzesakfrul
	S5f1QuE/g1MzqGp/tglBEZjduGGwPk+wntb5Xrt07lY5YVJx6xhEX4KUxmSdHBoQnNzxAXmsvIW
	pzxAbWlvv/zDmCRGMSg2BJLk/YwdrIXIij5n+htAocGZIq008MQYqb94OOBto+5Xx8nbPpi4ns6
	9OMhV2o8jQJNBdNfDPPy/l+nto7JhgdvQ0OHNT6Ww42Z69FL+Vs/wUz6FzSqAjQ3oG+/wuanyxt
	UwKp3s7ammFqg4aDM8QyiQuviBTRj5ujxdH46rx9aNe9CBPHekfN+IcX8mymJq6TjbGgRf/fCkb
	VYlHOF8CsnwlF+nIJgrpse5zCH4t3OIEfso=
X-Received: by 2002:a05:701b:21cd:b0:1b2:5f31:21c9 with SMTP id a92af1059eb24-1b543b19674mr4990798c88.6.1795092360904;
        Thu, 19 Nov 2026 04:46:00 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm22350329c88.9.2026.11.19.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:00 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 19 Nov 2026 21:45:56 +0900
Message-ID: <20261119124558.1548-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
PCS powered down. The USB 2.0 pair still works, and such monitors often
have a USB 2.0 hub, but the dwc3 controller still runs from the USB3
PIPE clock. On Kaanapali the next xHCI reset in this state times out
("Host halt failed, -110"). USB stays lost until the cable is replugged.
Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
common") keeps the pipe clock branch enabled. That is not enough here.

This series registers the dwc3 glue as a Type-C mode switch next to the
PHY, so that it gets the mode (it does not route any signals). In
DP-only modes it moves the controller to the UTMI clock, as
"qcom,select-utmi-as-pipe-clk" does statically, before the PHY switches.

Peter Chen suggested on v2 that the PHY could notify the controller
instead [1]. This series uses the existing Type-C mux framework:
typec_mux_set() calls each mode switch linked from the connector in
graph order, and the controller (HS port) comes before the PHY (SS
port), so no new PHY-to-controller interface is needed. The cost is a
"mode-switch" property on each controller node. If a notification from
the PHY is preferred, the clock selection in patch 2 can be driven from
it instead.

On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
DisplayPort series [2]. The controller side for that SoC is a DTS patch
sent separately to the Qualcomm tree [3], and Tapas Rana has sent the
same for Glymur [4]. Neither should be applied before patch 2: once the
controller node has "mode-switch", pmic_glink_altmode defers its probe
until dwc3-qcom registers the mux, which only patch 2 does.

Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
PIPE clock on resume" [5] and reads the selected clock back from
QSCRATCH, which loses its contents in system suspend on SM7250. [5] is
still under review; patch 2 will be rebased if it changes.

Patch 2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, so with the
arm64 defconfig (TYPEC=m) dwc3-qcom is built as a module.
pmic_glink_altmode then probes later, and a monitor attached at boot
depends on Yongxing Mou's "drm/bridge: aux-hpd-bridge: replay last HPD
status on hpd_enable" [6] to be detected.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
backported to a v7.3-based tree that also has [2], [3] and [5], with a
USB-C monitor that has an MST hub (two displays, DisplayPort over four
lanes) and a USB 2.0 hub. On each of 5 plugs the controller switched to
the UTMI clock 1-2 ms before the PHY switched, back to the PIPE clock on
the next USB state, and the monitor's hub enumerated. After each of
three s2idle cycles with the monitor attached, both displays and the hub
came back. Plugging the monitor in during s2idle woke the tablet. The
mode arrived after the glue had resumed and was applied right away,
before the PHY switched (once with each clock selected beforehand); the
path that applies a recorded state on resume was not hit. A USB-C hub
with DisplayPort and USB 3 kept the PIPE clock, and a USB 3 stick on it
ran at SuperSpeed.

Changes in v4:
- Patch 1: add Reviewed-by from Krzysztof
- Patch 2: mutex_lock()/mutex_unlock() where nothing returns early
  (Krzysztof)
- Patch 2: leave the probe code as it was apart from the new argument
  (Krzysztof)
- Rebase on next-20261118
- Link to v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com/
[2] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/
[4] https://lore.kernel.org/all/20261117113834.925310-1-tapas.rana@oss.qualcomm.com/
[5] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
[6] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/

Joonhoe Kim (2):
  dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
  usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
    modes

 .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
 drivers/usb/dwc3/Kconfig                      |   1 +
 drivers/usb/dwc3/dwc3-qcom.c                  | 150 ++++++++++++++++--
 3 files changed, 143 insertions(+), 13 deletions(-)


base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
-- 
2.53.0

