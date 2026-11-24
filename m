Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550508;
	b=YgbFH+PcivfdftwHacjc0BVG0qQWoJWTSaZs23ZA58ELEbP9sTgCqPQFjayI+nBM0W6D
	 wgTPbITeUjYy0ODv/JEHmzxLxzTgDxt7QkLhhqyrXHgkpMCLiN1CWc7Hb67vw+0Xq+L/u
	 hgS7r9ykFcrgePsYMlWVxlotpwweBs3gMnL7wnIcBfdnoLEKTEk+tmsB5VgPMKJA2DtZ1
	 SO4cXGuL2G98mWv49zdZnvuq+r4kEdd7oynbXDkaAb5kii6rzViMHKpanvQ47FTsJa08z
	 m5t1ZvbRkE8VERPLmyHPxmD8LckD+hQO+RAuJZwrxMov7T3lGqsYjbI3aKAgPpI8LsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
	b=SfGugOrW473jhdIhYCzJT9c3Ds3jfT3FSgH6YyiJBCATcouReXGcxag0DAmlZIoAucaB
	 xwJ8ylSPbbxfGO5lGlqCE+9S8pN8wn+FYOW8VCKf+iBKFhihIRtQBzTNigaN/kELfx4LE
	 s9RMr1yPaKg/sCOD+zM/B8fkycyBhAeMSGpJHCePqq9RdLUE3RNvox90uVRwRpf8ELclE
	 3lRaDkoPPDRzrdwSq0xeOl3Jj4kNAvxia76mqd19ENJbjDJuo9au6avqSMrmnQfv/tHhf
	 VMYPOUWcJNjmu/USCXeYdiAgsqqOaw4Z6MWjJKSp+PaOQJAXnwTnyULLsX/Jts/QUgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUBHRIjn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cCb7QunG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17892606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17892606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUBHRIjn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cCb7QunG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXGPs1132311
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1gByKWms90rx+ZYM2PzY3C
	prddTIzxOBqUOzZScJ+EU=; b=nUBHRIjn1pCmJwzztA1YcOY736l7TtuRsJ6kFb
	jrw2ctcgfWvZaGABsWaQT1OW5YcaZvIfaiDwWc2dItZAOwcUv8gwNzwNtM571xit
	Daj2q3OtyI+HafktVNFRLubsVdliReBEGj/E4ce0dz+Mrej8lBDfD8FhJTV7Y9oI
	JbkPSXZkjhH2n+0wRIQHO/fVx3ZCq0hJZeFWWECOeg6RIuvGymSp974It1srwNoR
	fTSAxLwrSfJwQsXyN4vuh4vYoXTTXhsebM+ASamBS8v04f7ooCf3arXUZ8545NWr
	ef2jmm91CyrkNS3UsqDjb4mCqlWBW3e3sZC3NGRaeyp3uaiA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd8nrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso194365e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550506; x=1796155306; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
        b=cCb7QunGRv88zEL9Xpke6c1K+2W3nxjmgMQ7DWfmFnrV0G9Cht9kACrLXkk8YzI2i2
         v4e/NCyc3wXExr/0mbYuf+ud02iYRhCategohqJ6kHjkbX0bwIESMu5l5UPOZOR6oe37
         S6Av+sKOmXB5hD6sbicNBKrQ3SNVZ0mtDmsiAAI0LFrDi7VUuc4l8jlYtF3hAq/xqxll
         wd2nR6Wmh6ntwM7j3fznujUEKbJXFR+RzRMp6WQOEVy1F5UvHl4rjqTLHAkvmucSCCNf
         +Il08ljQZ8hcdYLGbI+4nGNAK/Unrx7oNQa97bNp52ZlVfQ7Ks3goUQ5WMXtINg3lJv+
         WIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550506; x=1796155306;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
        b=ytgUvFBf2tIoOqXUbWZMYFI6d1TC5snD4WnVVZ3fvEeULbWtZ/hIEt8osJQzyD7COh
         x/Q/iEg/SAwXnDA9qBvUJUAhUOJwOFcubiXYMr4Q52UEOCE1UOwkjTnCwsJbv+j1mjAL
         QlJl4RXLpI5XZFvaASuWeCqqvhAAw7RA/h86QZsmVHHyeEnQa9ek4Rag0Jjz1ePaIJG8
         kAaYCoEvrcd3EL7z82CJJew4JY0PpIIAA2B+l4JbUb3LFRT74T84gaS0WOHwPPwOEhEf
         gOx+h4uNkFqtMwuYiLKlNqBbpX36M0V1oKHnqo8MgQka5u9S3ELJ72Jk4k/kvAp/cDvX
         BujQ==
X-Forwarded-Encrypted: i=1; AL+hErGJo8nQgDo6Lf2k+aFAvDCUFiaQLRCYUMs2p1+rfclwkdr7ONA9DBJ6HgKcI6xIaamk6eUS71zK7l3HQd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pBsXItg2R4hPGogo/UPV3hqAW0Ehu0IJuRW4UtTAM0MJmUzj6
	ppu6vW1C/Z+D5RJFBFzUJTy8kQsJqHJsXEybsF14CNCwWpUkJZMh3zVTWyzlTJExNC3GwkDT9vG
	GCccM/kILnrnGOdl8CufqIDpB1x7IW8KlV/DTVhfS/j9JhhHjJufKHIKkoB5VUsEG+AE=
X-Gm-Gg: AZFdTZdlTWB4exjZza0P+baxNIxhBUcTYklD4BEam02wz1qWN5EFZkvfCWdNJa6S0X/
	4R9J+vVjirIYtbr8hewyMEXdXA9nRtazvm8acCbeioBCIrQjSocyxX2dZ/xFi4u7KDAVumnov4o
	KUF7lKr7zDQ1yKUb/WCZ5j8vV9j71i4eUIs625z272ZGEWmtB+zLAgBIzNjBj7Ar4ZhvCEkMPJH
	ohZF6TSocHiBNXbXpJaN2fgWtj/hIqnqt5ieZHP7CAjdjr6xBufKzucuXwcY2sEHSAw3E5/cw3H
	Cx8rO7eWtnkbfjBwB5Cr0jJUKXDHSCLC4ZM5r3fkxq53fZr6Rpzpj7/YG838YXACZLFvg63tXzO
	EXdkz+LQOtvA4bsHTeN2P3UlHycoxhMcPLGgole5VN7zfvBb2echLFEERDxpWuoj0wxRnl9ESQ8
	En8bOA2M4=
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr10992448e0c.3.1795550502958;
        Tue, 24 Nov 2026 12:01:42 -0800 (PST)
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr10991920e0c.3.1795550500218;
        Tue, 24 Nov 2026 12:01:40 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [RFC DNM PATCH 00/15] Qualcomm USB4 host router
Date: Tue, 24 Nov 2026 21:01:29 +0100
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrtBWsC/yXMQQqDMBBA0avIrDuQjBJor1K6aOKknYIxZFIRx
 Ls31uX7i7+BchFWuHUbFF5EZU4N9tJBeD/Ti1HGZiBDzloasM5ZAiZeK57NOow64bRk9NfeGdP
 7kSJBO+TCUdb//f44rV//4VCPJez7D6+h/WN/AAAA
X-Change-ID: 20261124-topic-next-20261116-fsm-mvp-b936003bd2f2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=7195;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=A+ZxrCHc+xf8sMBO+IHGTxF3X/zbPOdINNbdHlkOLNA=;
 b=5cbCykZEDXFsQZZ+XcavorGkQhh0sBNtwv2IC4avWJ42tQ1OxbK8wzU1ieoZNBVY+h/jWegS/
 EJ0dmLm80EQD/WK73n9pQNYozrvN9nj5js9NDwJ3v+pJ66kPr1hIS5F
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXwbd699zsilVg
 Ba22gWbwJ/sAVFWK3jcl5eZXIMxKHBQY0jc6DyHuk0TSC6jSygJn8fXewK137qOjuDRH1HkW/dk
 txFj6H3ji0xUkuEbCLs0gJk9B4YM85A=
X-Proofpoint-ORIG-GUID: V1gUd9Ft2RWQbXPheJ8vJd3sKK3QZ5yX
X-Proofpoint-GUID: V1gUd9Ft2RWQbXPheJ8vJd3sKK3QZ5yX
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b05ed2b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Q-nnJTdTW8WZejlXziAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXx2kKah5/IPYn
 n70X3ux6tqKdoFpTzm+dvcDyvmrmQ7JQ/FF9bRlRKAqD17+YTYmlX0NMKXXvPhe7WRB6fWEQTJe
 aDuBMyleCm98jOqTKJWhMx90a+yBhBcnMEnt2/mTyHcDgTeEPmxp6s3Y2BNbVlZP2JLkeF+Jd2d
 aJY2V3kpMa2NJnbX3dLIdxrTDB/wyPAOWV3R8EazXO89oSoEszWcfRAn6V33b5u0k0pXLusg/eT
 HgZEcF1Fg0qW9v+k+2TG/Nt9LsvsrjF+2m6AXHLUHX4nOczUBnnpZ5PkOzplaLuZMJM7f27YovQ
 FKOFxmbRzJdnCzmOYOsb4hk0SnF4ceCdpEuT96+drEkFB1EBYKCCBqHVcoVVw4kcWnXj25emqxW
 akBwbTpTsRTaXAcQgpXGXvneGRT3o4hOjyo5W2rEp2HLaWg2IoiajkzJqbWEr/WdrfEnSADsEkh
 j6leWvY+Pup2/TNvZJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is an early RFC, mostly looking for acks/naks regarding the
bespoke power state machine and Type-C handling in qcom.c. This version
of the driver can power up the hardware, have it suspend/resume, but
notably not drive any tunnels (as that depends on dozens of patches to
other subsystems, many with shaky dependencies on the still-forming
usb4 dt-bindings [1]). Absolutely not intended for merging (unless you
want to take some of the intermediate tbt patches, Mika).
Speaking of dt-bindings, this posting comes with none, as it makes no
sense to waste maintainer time until that GitHub discussion is settled.

Said state machine is an attempt to tame the delicate clock setup,
which if we don't get perfectly right results in the machine hard-
crashing. More on that in the big comment at the top of the driver.

The Qualcomm USB4 host router is an in-house design, implementing a
standard NHI front-end with a lot of vendor glue. Because the USB, PCIe
and DP blocks live outside the subsystem (and are wholly disjoint), a
lot of elbow grease it required to have it all behave (similarly to the
Apple implementation, but with more manual clock control and firmware
handshakes). Native protocol controllers can only resume after the
router has re-enabled the links (which collides with today's notion of
nhi_resume re-enabling the tunnels), so that requires some
consideration (again, not included in this posting).

USB3 tunneling requires:
 * a bit in TCSR (tldr a syscon) to be toggled and the path to be
   enabled
 * a register set in DWC3 to work around an issue with the USB3 adapter
This is a fairly low-hanging fruit, but still depends on the bindings
to get the device link changes in within the USB subsystem.

PCIe tunneling requires:
 * a reset in the USB4 address space to be asserted
 * a number of additional settings on the RC side
 * standard PCIe hotplug otherwise works as expected
The link itself works without much effort. How we set up devlinks and
whether we can go forward with or dispose of the router's power state
machine will shape the suspend/resume handling there though.

DP tunneling requires:
 * handling a secondary mailbox within the USB4 subsystem (not
   included)
 * setting up the display crossbar/mux correctly (any of each routers'
   DP adapters can be muxed to any of the available DPTXes)
 * settings a couple registers in the DPTX
 * driving a secondary AUX bus from within USB4SS (the AUX controller
   in the DPTX is blissfully unaware about the existence of USB4, so
   the OS has to ping-pong between them at runtime..)
 * HPD management
Because of the muxing and runtime AUX switching, this requires
sizeable DRM changes, including Luca Ceresoli's work on bridge hotplug.

Additionally, the hardware is constructed such that the protocol
adapters need some of the native controllers' clocks and power domains
to be online, hence the odd DT references.

The uC doesn't implement a CM, it instead does some housekeeping
functions, but because it doesn't have a view directly into the SoC's
register space, it still requires a lot of OS coordination. It does
however take care of link establishment and some of the TBT-layer
chores (such as sending PERST# packets to PCIe adapters). It requires
loadable firmware which will be posted to linux-firmware soon.

This series runs as-is on a Glymur CRD board, minding its limited
usefulness given all of the above.

I know this series is not the entire feature set and that this was
promised quite some time ago now, but as I was humbled to learn,
sending 80G over a wire is no easy feat. I'm looking forward to
removing the remaining roadblocks and hopefully getting there in the
upcoming year. Please chime into the bindings discussion on GitHub if
you want to help there.

Dependencies:
 * https://lore.kernel.org/linux-arm-msm/20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20260928-topic-usb4phy-v6-1-815a73b063ef@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20261117-topic-pga_nousb4_glymur-v1-1-0ede74e620d0@oss.qualcomm.com/

The base commit (contrary to what b4 says, because of said
dependencies) is next-20261116.

[1] https://github.com/devicetree-org/dt-schema/pull/196

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (13):
      phy: qualcomm: qmp-combo: Add USB4 power_on/off to de/assert USB4 clamps
      soc: qcom: smem: Add and export qcom_smem_get_serial_no()
      clk: qcom: gcc-glymur: Don't poll the status bit of some USB4 clocks
      thunderbolt: nhi: Clear ring interrupts when not using MSI-X
      thunderbolt: nhi: Process ring completions in the threaded IRQ
      thunderbolt: nhi: Add pre_switch_suspend hook
      thunderbolt: nhi: Resume the domain if the NHI suspend op fails
      thunderbolt: nhi: Resume a runtime suspended NHI for system suspend
      thunderbolt: Raise TB_TIMEOUT to 500 ms
      [HACK] thunderbolt: Refuse to activate DP/USB3/PCIe tunnels
      thunderbolt: Introduce Qualcomm USB4 router driver
      arm64: dts: qcom: glymur: Add USB4 topology
      arm64: dts: qcom: glymur-crd: Enable the tertiary Type-C

Wesley Cheng (2):
      phy: qualcomm: qmp-combo: Add Glymur USB4v1 PHY sequences
      soc: qcom: pmic_glink_altmode: Enable TBT/USB4 negotiation

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi         |  107 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi             |  703 ++++++-
 drivers/clk/qcom/gcc-glymur.c                    |   12 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        |  321 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h    |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h |   22 +
 drivers/soc/qcom/pmic_glink_altmode.c            |    5 +-
 drivers/soc/qcom/smem.c                          |   22 +
 drivers/thunderbolt/Kconfig                      |   13 +
 drivers/thunderbolt/Makefile                     |    3 +
 drivers/thunderbolt/eeprom.c                     |   17 -
 drivers/thunderbolt/nhi.c                        |  168 +-
 drivers/thunderbolt/nhi.h                        |    4 +-
 drivers/thunderbolt/pci.c                        |   15 +-
 drivers/thunderbolt/qcom.c                       | 2299 ++++++++++++++++++++++
 drivers/thunderbolt/qcom.h                       |  251 +++
 drivers/thunderbolt/switch.c                     |    4 +
 drivers/thunderbolt/tb.c                         |    2 +-
 drivers/thunderbolt/tb.h                         |   20 +
 drivers/thunderbolt/tb_regs.h                    |    3 +
 drivers/thunderbolt/tunnel.c                     |    2 +
 include/linux/soc/qcom/smem.h                    |    1 +
 include/linux/thunderbolt.h                      |    8 +-
 23 files changed, 3914 insertions(+), 89 deletions(-)
---
base-commit: 516d5c8f674bc07eb35c3b97fc21e79e41158dee
change-id: 20261124-topic-next-20261116-fsm-mvp-b936003bd2f2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

