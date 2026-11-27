Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751615;
	b=3sAnOqzntwaqNccz7CxX9uc+c2kjsyKlUdujQWdsoBl9K4RvFv3UsfT7tegQN8Bp6BdG
	 SkPZ6xqVsTBDqzxUQ+dEQvjjB12T6hY7JVm4p0WuIiophuy0b46zJAt30S6NahkfhtL15
	 8Qg5R7fBmQgmIx7uH6gqlZBH5gCBXOPrTcGUtZCL1816kgrfuIirZpK6zPBiQQuXxuFr6
	 cd7+QS+dpCbOkgkoprhMZJJNqOHhksmvsuO6KJCLkf6hOMrcxxspPcm2NowgD/xkJsBnJ
	 0x3kuL3tYt2vyfgB1VHjnvWSl3VOlzwC6k+1+BiXCfXLx8nCkA8s32SoS8l9vLQBbvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=DpfRq3v/vFUuP/GqS3HMHJixsm72InVae3hSHlg1iNY=;
	b=ShFQVB0KYWomYnuCNv1Hr2zT9IIjFC/vrYly/0ZB2pdk2nb1fygRy+DegJJMoWEZY6Bp
	 sbIIhVh8t49lwbOqae2G90pyeiZsA36Fo4ofNaFf7VMtZ2kHpg9LxmofnCBt1yeaW26Np
	 t9fDgpEMsUH0rWBEMhivNh6zMuAPxT508HWZaoFqL/8GVUDuLsP8fpctI71glvtkorxu+
	 Hc+B3kxD3czQ+8syi7yOkTOVM5zvRmdCIKQ/YIwhZdwzDVSy7CWFDhXMNt0NdgxXp7sTx
	 Lvio3N6zcX18u7xIGYQRzVa1JlMad31t8qo6x4025Uq63wi6EeEDALqiHHezCPlOKjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=LwyIBLJo;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=LwyIBLJo
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jbKJk10J5z5B0rY;
	Fri, 27 Nov 2026 11:53:26 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795751606;
	bh=DpfRq3v/vFUuP/GqS3HMHJixsm72InVae3hSHlg1iNY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=LwyIBLJoyZNd4MWcbqJK6ylGe6d1m/Ijw8cWLBNxOcVBk4k8iBfjzqC7VOC4zQGO/
	 P/0kqnjH/WpzuIT3bzhLAIkGGtHggecxcLOtFTDnNVonMlaWkuyaYbtPIXRTYvJx/X
	 3aEI1ryOxNOvjGtKc1RS/zRyfBLjh695UmwQsD8DoD2wtLKbl8wvRtpkWKPN3rB/4N
	 MjjB95p3LKTdglaVE2p+JpAN1r2UI0VLNd5ekBb2GPkUI4dcABH9dervfVHVVfgig0
	 LyvWuwzdnq5IdbiUABcCDixM2DlWLKF9p1oV/ADeG/6MGLBGzrco/NmI10A9OE/W+z
	 1GaTOaN5X+4lw==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6AR3rJB2020213;
	Fri, 27 Nov 2026 11:53:19 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 27 Nov 2026 11:53:20 +0800 (CST)
X-Zmail-TransId: 2afb6b08feb0080-e49bf
X-Mailer: Zmail v1.0
Message-ID: <20261127115320872WMZVf3eQq60Nr6irvJ5ax@zte.com.cn>
In-Reply-To: <179442103029.44545.1262285836401934201@kernel.org>
References: 202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn,179442103029.44545.1262285836401934201@kernel.org
Date: Fri, 27 Nov 2026 11:53:20 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>
Cc: <mfd@lists.linux.dev>, <tharvey@gateworks.com>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgSTJDIHJlYWQgZXJyb3Jz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AR3rJB2020213
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 27 Nov 2026 11:53:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B08FEB6.000/4jbKJk10J5z5B0rY

Hi Lee,

> Should we propagate the return value of regmap_read()?

Yes. v4 stores the regmap_read() result in ret and returns that error
on failure for the firmware version and both CRC reads. If the SMBus
read ultimately fails, gsc_read() returns its errno. Probe stops before
registering the child devices if the version or either CRC read fails.

> Also, really not a fan of functions in if()s.

Understood; the revision keeps the calls outside the conditionals.

Thanks,
Shao
