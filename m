Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180169;
	b=Mm4ZGM3Vo8n0MaZrtSTelhda4Hi6kdY8ZUrcv3HqD/S5saZ9yLvDlmvfNurf/A9/AXJQ
	 aF++s0eDS16eThrNSvJmT9Y+uwVdg6+HV7/wDaIa5KF4tpMBWNRq9KHinFsGVNNJpm3Do
	 mEjwohvCYR95VTXaUBQjnde98fk1/hxq2SNZrqvUaKMuZVK6lRP2pKuqT00AEFo8wRzZH
	 VgHg4NWm6eid7zD3bR5aPI2QJVXYeN6FyEpdyH6E0umOQwv+Q7NlW3U2LbyOjxBPjc1Jj
	 ySoEia3IWKegmYjf6VWfq9SyWYP2wC3j2xJtnMgtu7KpYcOWuDihIkgx7t7BzdrXKog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ9VyZKxaw=;
	b=XLYi8Vgkr1zTK3jUc6foOHrSCYGSmN2ajk1JAVq+ddr1IzzUpdfBNHUGqCTWHuoYHFcM
	 6CqRlJCVpieR6DHnMatM0gYcSgsv05wCRA9CZUAA/QXba+c5wGF2vsLKzKBG+PUk+CNkA
	 jbSe5/qkLUCnFY1XIzONYdjiEg6bMoi2fYj1+FVEwN8ujGaPmy/oRCFYSi20xVL9RxA2z
	 si1Pr8tY5rextbBMLDLOo9QZr6ma4JbD3cxFkKtfjhpoz22a/mmhZU7lvgzsRMboTUu/S
	 5El0gfkhT1SOrOx3z5DfiutF1hNbwuxHkb1TJaPy+K2El43M2pelbn2eS5D1lPjJvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwXdY7Xt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoDQKvdm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D8606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41D8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwXdY7Xt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoDQKvdm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAju1U1168933
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ
	9VyZKxaw=; b=fwXdY7XthpiYtMiAfXIikQFXzC3tBxFd2PpIGGUW1Qiejpck48/
	s0A8dsKUQAEOAVuQTvWFFwtCbJiysc3q8ATbiN3Z1psBorrPtZAbPLNTJ/R3mYWU
	HBaiCpFpnLMG5e9kRasAYvwU7aIP6VNdxV/8yVLRp71fh/I6TgjlLJxQLYWcG92t
	I0ejwYrRjTVT4PJmwAo2aWumqQLTdcxIrs8XwF1gf00v6E0afLYpP/cPgfne8oy7
	rqYAbHjk5+esMu3cu7e9lIf0GFCHkwnpXhvM2ZCJsbXq0sjuW1gsUzwjNxWGGlbM
	7aRfR1uOtpZj7T2CWiRjw+jGS646aamB0Qg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uuxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:09:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so242006185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180167; x=1795784967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ9VyZKxaw=;
        b=NoDQKvdmeo2pHX2Wb1NPBOqaVOyXJrwY2ncxuEG7n6niU/tsWQmSNS416NYvehPRy5
         AC+LyYo9htKyVgKqpCt0e2AXoR10aIBQP+s3UynTAwXDij3GgnqJ65FwqMqCtmACJ7nO
         1vDvqvBJmMDi3BahFFsgjC+4sPxcW7yztaPN1xy4FsShXMlCfoGo6ckg0PH3RXAhGylu
         avdumpVT75fKclRm4hFDMHJy8634MOWba8dtJ1V9xpMCCJGpEJ3Fb17+mBI88970gR/A
         ofOX9L2PyR41K8RmgMVc2lSopzycm098T7u+EaZXBZsdeqyEcL66PNGif30t6Q3qOmHB
         44/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180167; x=1795784967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfGphMSJHSZQ87+RM9UdnonKp5M5o+whIFJ9VyZKxaw=;
        b=i6MZz+Y1LL/8zuItuiG01Zkeit9ZF4jgtsIQErC957vWTjSjf845YGnkLnqHX5se/T
         nNKzm2byyHeBkcssviJTydAPjQhZcdm5hdJ8t+y73l4y5AC/h6Kwymtwc0ICtXsSwlRx
         0KzzIZIvRLry3hlPuHzrNBIfUHfI1EyLM7dSu6txQRx/FknL69YwwcmUuTIWPn6ne4le
         qakwvpr6xuDDu0gLv2V8jPrYMhhUImrocBOqZ5mD7PyZkDHo4zilpkHGayZHEcP05XQJ
         DqjdLNKZMt+FZjt/wl3DplKwK4TpiklE6/ZPrK/KWPYi/9hFKvbD2EXcggfghnxNCn0B
         Nzew==
X-Forwarded-Encrypted: i=1; AL+hErFyAvGvs+mV8y836FXIgaRyXFiiJccY2aTpi5kThmgEZqvPbaZI3+D8XRHucl0RHc9fWUa/gjP0g2ydNB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VaeIFkWrNyEbOMFUplyn7ywrn9NIdzm2eF+gLGl9Bq8m2GXvU
	w5tn6qpk8zRdsYEof4G4NVjuWhexa9QeMdeNiaxUMSYqst7pFHzD3WCO+71NF+q7dZCwc0eTuzk
	gCRIgMwbbW6ctyyuPJRQc856ggRQPs0EckyQMr+aq0Vaso/pkHSKQa7sHwyk0atUeNk8=
X-Gm-Gg: AYBFou1OIiZR6hcGUeoxzvZykHhJ1m3+IVPVmcHbhgdSXMS8NcCtiMPazOTa8E6hAZ7
	b7cSMcxDi2AraHsX0YN72cJE9n1n8s/RzxkEeXzrPD0O9rfxXcFqkqv63s9B3sAfsv/qx9VDS5e
	72HmKh3qm7t/jfFixK6L2Jh65H1hRcdMNaocYgbvbKkKj5Mnk8udZDTkQlZIQSJ76GncS+xxDo6
	7gy70Hv3ntkyh2zSoz7ncBAgCg6unz9ErZwNZHaZQi6YZSyVe0PM237EKFC6Ioy4REQ8HM5BScD
	cKseyRvtS79PRy3X5H756nP8pyL2uDyHe+qzue/oKa6xe/mUM2jbT1xeIUg5VIXSid6bXoe32dK
	4qxw571hdSzFrox9BuCyjlwak0CW6aGT4b4GUjvTTsc8Dt5T9BDdIhN9aSo95Q/9Sp4oTVDtfQ9
	M=
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr477755285a.38.1795180166690;
        Fri, 20 Nov 2026 05:09:26 -0800 (PST)
X-Received: by 2002:a05:620a:2945:b0:949:6574:f36a with SMTP id af79cd13be357-949ba9d02e8mr477747485a.38.1795180166030;
        Fri, 20 Nov 2026 05:09:26 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm5780973f8f.31.2026.11.20.05.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:09:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 14:09:21 +0100
Message-ID: <20261120130921.29111-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX3aClnL9Ya2qc
 a3PKMHUyXv6auTXnRCJ2du6MrF5vV+QlO6D4AHyO+o5rCEM3wLzjEUZYodzkbqFuERLZqQ0Hyku
 CILNvAusSbQpfbxxPGuHT/apCqq7Vj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX+4Z6jBbene+T
 RlYDCNyDGyaQv4p6p84xEc6RYBO1bxtzETdOCcXijMD3PKijF5Q4A91oNJ4h9/5aZFJWFgASz6m
 01aLYEFAGVJYS5YQyCUqNLzSPu+LrMF4BZHDExudfVk31M19YFThYH6jJJn2l3WgDnT4D6B+MS9
 8+0ZWopKLiIWEpQ7Td8RozfYwH8rhv+JZ49kUNzYBxAKv9hmMUN53sHrW/wcrt+E0mCDXwwRzi1
 7boTTKhhfI0FFRPQFGuV16FodpG4hGgORK7k8zhm0C6Ic65xdNumGkl1JqXThgOO7iLPWlY8+pH
 cjnl++LvfG06qsnsVzA2UPeOu0IncWBPLTwfm4On7xRsnOHLZB+Vm9NJT/CXUyLCxT+++UpwRo+
 uDR8QiqL6KnYpz5RJKQ7xCRSS51ArpWksXkMTct7TPx/AqwPfSw95laXdqYaNVIiX1SpVUJPqHG
 I6NMVlRFTP4clr90ZXg==
X-Proofpoint-GUID: j0Y1m2I1xvUKROpn2VwkhAnKX4WBgpkJ
X-Proofpoint-ORIG-GUID: j0Y1m2I1xvUKROpn2VwkhAnKX4WBgpkJ
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004687 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=ZPUh5YY5edBcq0qQK8sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200052

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v7.4-rc4

for you to fetch changes up to 31678e68f82636a27fbad58ae40054557da4fd7e:

  gpio: shared-proxy: propagate -ENOTSUPP from .set_config() (2026-11-20 13:36:53 +0100)

----------------------------------------------------------------
gpio fixes for v7.4-rc4

GPIO core fixes:
- delay freeing the line state workqueue to device release and fix a UAF
  bug
- fix races in access to the flags field of GPIO descriptors
- clear the debounce period field of struct gpio_desc before clearing
  the "requested" flag
- propagate -ENOTSUPP from .set_config() in gpio-shared-proxy

GPIO driver fixes:
- check the return value of clk_prepare in gpio-omap
- reject bulk-in endpoints smaller than 3 bytes in gpio-mpsse
- validate the pin index of interrupt events in gpio-ljca
- disable interrupts around the chip lock in direction callbacks in
  gpio-mlxbf2
- fix line name handling in gpio-virtio

Other:
- do not clobber errno on read() errors in gpio-watch user-space tool

----------------------------------------------------------------
Alexandre Becholey (1):
      gpio: ljca: Validate the pin index of interrupt events

Bartosz Golaszewski (8):
      gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: clear debounce period before the "requested" flag
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      gpio: cdev: don't overwrite the whole flags field when configuring lines
      Merge tag 'v7.4-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current
      gpiolib: keep the line state workqueue alive until device release
      gpio: shared-proxy: propagate -ENOTSUPP from .set_config()

David Thompson (1):
      gpio: mlxbf2: Disable interrupts around the chip lock in direction ops

Gu Bin (1):
      tools: gpio: gpio-watch: do not clobber errno on read error

Hyunjung Ko (1):
      gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes

Jiawen Liu (1):
      gpio: omap: handle debounce clock preparation failure

Lianjie Wang (2):
      gpio: virtio: bound the line names block by its configured size
      gpio: virtio: compute the line names size in a size_t

 drivers/gpio/gpio-ljca.c         | 11 +++--
 drivers/gpio/gpio-mlxbf2.c       | 29 ++++++++----
 drivers/gpio/gpio-mpsse.c        |  4 ++
 drivers/gpio/gpio-omap.c         | 10 +----
 drivers/gpio/gpio-shared-proxy.c |  2 +-
 drivers/gpio/gpio-virtio.c       | 13 +++---
 drivers/gpio/gpiolib-cdev.c      | 95 ++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.c    |  5 +--
 drivers/gpio/gpiolib.c           | 39 +++++++++--------
 tools/gpio/gpio-watch.c          |  2 +-
 10 files changed, 113 insertions(+), 97 deletions(-)
