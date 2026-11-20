Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146431;
	b=IaebHhk2qh0sriOOrk0Etgn31LRm6ruOL67Q41Q9Iscdf7eZdM6NGYa/k8g+0K2ik+qx
	 Qb+FkIYg7lgo3KEzpO226dku3utrg/z4MVgbpb/WKve72GxZkqF01fO6qFPWBiGAtdMw0
	 pVHEGaSQrlXuBP9OFQ3OXIQs8ih2R+Q0LNpLVGjUnE2RLGH+OQqno01zZq3w2GaqC2wZe
	 q1kj14VySA/Vk9YGSNHDi9N1+cnUbgM1QFXgz9NTQ5jqc8Yx3TgDgdjC8mhVsj56L6Vaj
	 Tp8vwv0/WdbwreHvKkFpsZrcAfDn46Ecy+Lec2TGfwh9REsgkDy/LvgrHnTrUCsjBPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
	b=5ow6iJeaKx16wMOAVZxLLO3cOBhMIFLuvRWfzziuR67/2biMOBmoFssT9PgC+XW2iQzp
	 +T8pZusVo3PIpP9TIHMxVbA3k4wYlo41EcsqukHIar8OWmpn8cLtV6KZRS7ojFwAbryfs
	 +lFRABIN71b86TxZAYNwKMH3OW4E74WtlR1hPOqY6q1K06ltIOo1re5DnLeeJyz2cXdnr
	 QcscCoYdhu6U1QsKdxhbbfrq5KS0JC6f2VSgYY3JiHpHIcwPoySctLKD9iYlwFnfDgkv0
	 6+WGSg79Xes0Z3npSvwaj2rXETOFKXDlh1UHiJmymyiVbUpLmA9oqP1Fl/mmL78mI/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lLf2kzT2;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A9606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lLf2kzT2
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b179528d56so243821a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146429; x=1795751229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=lLf2kzT2lePKBgkST06X1Iaazif3jW3bNdINE/GdFmoM7vT4txZnJ/K0nhovB8+qzA
         qY2ctuJV+UBu2rqvJLbcAAzW/ut3NeWAmB/kzZzVG7YKgSMQYjPL0q5VRsFKH0Qv99hm
         7W3W5YFugak2zgu93DWFW59YjP7Zt9CkuzRQCLTJBSw8CViQfYETL5O6Ul18Qyf30cUG
         0b4dqlok1MwTlg2acNO0WZkH6a9lK3tkjlRpqfvmTed29LJjf0M47cJERx1vL11/8MEN
         hXuD8PLAiGcBZXbWTOFentBJsiLZRB946I5nigldU236zvOuQZjh9sboJJuJDqGhgD0s
         yhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146429; x=1795751229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=0QWSYSmuO/zMCWSfY2l1lHbyMT4Hg7Yd+7yt7pXzDuiHiVjWT9hHssydneb5eLsNUV
         IZoz1mxirKiXgp9lSsL0/o5xdUnVODiG8nK68ud2vRbtgaS+sF98YDHJHyVBj4Svj6RE
         jsjd7UI83WHWJBBkM2PVkeMSuuC4lwsESfMH9lMU1AZl0w6YLQMPAogY3xjWRAfAZ10L
         q/CCURR9x5p7OOItGGwPHzzNUb4BYq55uwQN4owR0EMv3dZFKd+Xo5YP04MtMzc0ePTo
         y9osMM3s4JgLkXji9riyAig4349BQsd4phXd4DmqifajBHQ41tlv6FR9vnKoyaN6zh+c
         t62w==
X-Forwarded-Encrypted: i=1; AL+hErGZkv9BtrglQnTBYNSBeUcH2Ived3jsmZO+65nyloddyTqCGctHwv6i4MdkhDNkyw9ecv+y6mrG4rUCt8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Esa8OiwjtFvHQM6PzUhvi8XtVturkuM0mNPKnNVl1ra/Dp295
	icLbStbOu58MtTPgQvZ85pznmS+NMd9r4KtBhi7DlN654RO/yt5wG8JiR/92w8sH+g==
X-Gm-Gg: AZFdTZd1yf8ya0LQGWb/EWZkExGPq8H64I1YVafsABwVPifn3ACdCcw6N4M6nekBz5K
	2nEPfK1wvReSj3vJwoWFSVhcIRLIKe1oAKGgBLVtAa9Sur8dfNjCldgk6BZK6XQCVWWtZDMnoAB
	vioHNz8bX6jpGVIi8JHjnwF0PhuaMeqgKr6uPlHjN+m/Um5b3ufqhkUDxOjNU3S10N3tD1kYz9g
	ywIwt1T+Kl2DZJNzrqiIzuaxLOloe+33qsnc+dneo78sWwHgPtgDXoK7+khc5HSNUOgfpLd8ASC
	/MLWQubnP0uv+A9n8qsm8d7YMdr03E9yYv2gwpS4UnbdR9M8TInzyyKPC2sNCDxEuR0ZTN2MeY3
	uTO8uPSXkItFUCZwVWwkrQjERAN0b3N8y2l8rZX0eiQwgbfJxjwnxpnnD3/nitvV/gOUBsJbcFE
	0SiTZ+9NIKX/OaOKVwMvRkT29HBhWGzx17RBiDomIc5rWgbmnV1jpC3xMzxPHqDhxFPVmCplXum
	T48GjeePRy3+yKaqOjxQoEPj2jp1ZR+H0AS4M/Q/9D+XUkGl2Z6pX3zglcnt9qhsnHeb+gIRqVd
	LbE4cdJARebtt6Xl5ZYd+E5YmfQvkN1HN9pfhWVEVe2OJcH3svHc3MyJ7WZEssQW9ivNCJZyP+i
	gUGx/8Wxq84qSMFWJlw==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr1285768a91.13.1795146429308;
        Thu, 19 Nov 2026 19:47:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/2] net: ethernet: ti: am65-cpts: add PTP_SYS_OFFSET_PRECISE support
Date: Fri, 20 Nov 2026 10:46:59 +0700
Message-ID: <cover.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

This series adds PTP_SYS_OFFSET_PRECISE to the CPTS driver for TI K3
SoCs. This brings a similar hardware-supported level of precision to the
transfer of time from the PHC to the system clock as already exists for
the transfer of time into the PHC, whether over the network using
hardware timestamping of packets, or from a GNSS receiver using hardware
timestamping of its PPS signal.

The system counter of these SoCs, the Global Timebase Counter (GTC), can
export one of its bits on a push event output. The Time Sync Router can
route that output to a CPTS hardware timestamp input. The CPTS then
timestamps edges that fall at known counter values, so each timestamp
gives an exact pair of PHC time and system counter value. This is
similar to the PCIe PTM integration on these SoCs, where a selected bit
of the PTM timer drives a push input of the PCIe CPTS.

v2 drops patch 1 of v1, since it has been applied to the mfd tree [2];
it added a syscon compatible for the GTC register frame that selects the
bit. In v2, patch 1 adds a ti,gtc-push property to the CPTS binding,
which names that syscon and the CPTS input; patch 2 implements
getcrosststamp.

The series does not set up the Time Sync Router. Mainline has no binding
for it on the J722S, so for now a board overlay sets the route, as it
does for ti,pps. With Rahul Sharma's proposed binding for the router
[1], the CPTS node could select the route itself. ti,gtc-push would stay
the same.

Tested on a BeagleY-AI (AM67A / J722S), a BeagleBone AI-64 (TDA4VM /
J721E) and a BeaglePlay (AM625).

With this series, phc2sys steering the system clock from a free-running
PHC sees an offset that never varies by more than 1ns, whether idle or
under memory load. Since the PHC and the system counter run from the
same oscillator, this is the noise of PTP_SYS_OFFSET_PRECISE itself.
Without this series, phc2sys falls back to PTP_SYS_OFFSET_EXTENDED and
the offset has a standard deviation of 2.5 to 10ns when idle and 22 to
31ns under load, with excursions of up to 200ns.

When the PHC is disciplined (by ptp4l or ts2phc, to within 4 to 7ns rms
of its reference), the offset seen by phc2sys with this series has a
standard deviation of 2 to 5ns, whether idle or under memory load.
Without this series, it has a standard deviation of 5 to 12ns when idle
and 22 to 29ns under load, again with excursions of up to 200ns.

PTP_SYS_OFFSET_PRECISE has a fixed bias, the capture delay of the push
event through the Time Sync Router and the CPTS input (about 11ns, plus
an undocumented delay in the GTC), which did not measurably change under
any load or CPU clock. This series does not correct for this bias. The
driver similarly does not correct for timestamping delay on extts
inputs, nor for ingress/egress latency in hardware timestamping of
packets. It turns out that the bias in PTP_SYS_OFFSET_PRECISE and the
delay in extts timestamping largely cancel each other out. The offset of
PTP_SYS_OFFSET_EXTENDED relative to PTP_SYS_OFFSET_PRECISE is about
-50ns when idle, and moves by up to 40ns with memory load and by up to
60ns with CPU clock frequency.

The implementation was also stress tested by using ntpperf to load the
CPTS (-D 0 -M at 15,000/s and -N 0 at 5,000/s). No errors or wrong pairs
were seen.

To try it on a BeagleY-AI, apply this overlay:

	// SPDX-License-Identifier: GPL-2.0-only OR MIT
	/dts-v1/;
	/plugin/;

	&{/} {
		#address-cells = <2>;
		#size-cells = <2>;

		wkup_gtc: syscon@a80000 {
			compatible = "ti,am654-gtc", "syscon";
			reg = <0x0 0xa80000 0x0 0x400>;
		};
	};

	&cbass_main {
		#address-cells = <2>;
		#size-cells = <2>;

		timesync_router: pinctrl@a40000 {
			compatible = "pinctrl-single";
			reg = <0x0 0xa40000 0x0 0x400>;
			#pinctrl-cells = <1>;
			pinctrl-single,register-width = <32>;
			pinctrl-single,function-mask = <0x000107ff>;
			pinctrl-names = "default";
			pinctrl-0 = <&gtc_push_route>;

			gtc_push_route: gtc-push-route {
				/* input 11 (GTC push event) -> output 14 (CPTS HW5_TS_PUSH) */
				pinctrl-single,pins = <0x3c 0x1000b>;
			};
		};
	};

	&{/bus@f0000/ethernet@8000000/cpts@3d000} {
		ti,gtc-push = <&wkup_gtc 4>;
	};

I used an LLM coding assistant to help prepare this series.

Changes in v2:
- Rebased on net-next
- Dropped the syscon compatible patch, applied to mfd by Lee Jones
- Made a failed ti,gtc-push lookup a warning; the probe continues
  without PTP_SYS_OFFSET_PRECISE (Rob Herring)
- Three smaller fixes to the driver, listed in patch 2
- Link to v1: https://lore.kernel.org/all/cover.1794284248.git.jjc@jclark.com/

[1] https://lore.kernel.org/all/20260828100615.1700223-1-r-sharma3@ti.com/
[2] https://lore.kernel.org/all/179511436097.97786.7515300839199702588.b4-ty@b4/

James Clark (2):
  dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
  net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

 .../bindings/net/ti,k3-am654-cpts.yaml        |  17 +
 drivers/net/ethernet/ti/am65-cpts.c           | 313 ++++++++++++++++++
 2 files changed, 330 insertions(+)


base-commit: 5b87a11b1547c39da01718044b9f99fd85948b9c
-- 
2.56.0

