Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422256;
	b=vi0KA+rIT/OuwRVpfsNzQWR/VmNb81+J8yM/uaL5CAvuvmuKrS9/rFEGskFJgKTAq13a
	 GLHHrbHMcKhyzYJIyqvByVvaEAjieuHxVkTznw1vnznu4mYM3uGeMgQ/e+sq20u0f19K/
	 yKRYSADO7ghI1mRNlV7PT3am8/P2lKftCnBuz0QS9v7lHmvkYNW5w6BTAJhdP0y8Ws+XS
	 lhZWQ1bQEpOdOOKje/D+qo3lyZIPiFzYwh04KgyVStqsy2dyjfxiMfwz0k3OqIj8M/q6C
	 DtlChVt2UIggXLkPqIA0Ppl2q1Hhf5T9bvdGoevHBANHXrQjmOz5L4gQ9mO3otLbL1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422256;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=E/F9aPQoKXfrKQaypE4bbnWX3DetVkwn7UCBCBTDXjQ=;
	b=jjIpwrK4RyO4Uecc6zC85PvAfFqOWPuCS2TjeKn16DDth62XPF7LR+yLKtJHgWlDq62R
	 Xz3vnmWPXXsfq+lAUR0C6+9wZmJavIdntnqh+8gmKttG9mLN45U9MU7pakq0uLnJXyT1N
	 6ur/zFPwUuo3Q7qZ4DKd849/YgFFsoSqOdzSDDRSEPcZrlkEKHiBzMtrr3F/3UhXY66Xz
	 NBeKhDuzJV2IvzD63JfJen1DLvYk5KrvLssErE91wEnGunhkhj1Ly6F4rTPidTt03nI5l
	 xmRPe2oE2I3p/Z136M4hDsc/H93KM7JHfafi8vxvIqFm7tPkpQs91x/i2DoeIeTULGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=NUMV67UW;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA854606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA854606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=NUMV67UW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795422226;
	bh=E/F9aPQoKXfrKQaypE4bbnWX3DetVkwn7UCBCBTDXjQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NUMV67UWs9t18N1OIM4ZtUr1G4KUUyxlxQY4jj2StUUgrdfoqQDTi+/hY079+OY0J
	 OnVGI96JbaGtvfDqiSeE6UMz2sKFebG+gKu+BCHNHj23ZL7vOoQPmmEqMWNRGdnm7O
	 SxeosppPti5L8UZgKbXLnhj1omBx5TnVbELEq3yg=
X-QQ-mid: zesmtpgz7t1795422219t18ea3391
X-QQ-Originating-IP: PVyhqQzatqIPjVoEXm47QT9VjeoAIolcwI+N8CJf7k4=
Received: from PECI2040 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 16:23:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16570581694892023629
From: wangyu <wangyu6@uniontech.com>
To: syzbot+cff8e1b82d7911dd051c@syzkaller.appspotmail.com
Cc: agruenba@redhat.com,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [gfs2?] general protection fault in gfs2_remove_from_journal (2)
Date: Mon, 23 Nov 2026 16:23:37 +0800
Message-ID: <47E6766CB31C3F0F+20261123082337.77430-1-wangyu6@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <6978bb60.050a0220.c9109.001c.GAE@google.com>
References: <6978bb60.050a0220.c9109.001c.GAE@google.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NZcrde3zhHkVVrVS4xNBkTmMJlAdrg9SQkt0SNLUzZqn0V2siwX7de1z
	L4PLAmNOmKAR7ZEB1DgHw9TbkqBaSg+V7/2a473dCT+XZ5ff62FA6Jzox+p69HbiSUGsm6h
	AH7gloGSQxhQbTHlSHvJQfi6+ghvoHwvOE0hdGOMYmZq4L9lU7As82NbC8o+HfJNUnFzfPB
	37lcGN3MmKHz7moro5nCsTHMydaFu/cZg3q3z8vJFvTvkVRqBbQgaKuwIBkYj19Vm23IJVw
	p2vLXKJOEg0Rq6skTRwNlWXcnpJcLlBfC3Ah7929Mq2hdqOkfExNa1pwXtgG7TqOIj76XL9
	vLrFT8ul6tqHb6kkSlSe6Q+fViqgvBxVqJMPyiHxZpyu5cR4D2KAy+HhzYj/BZsHT7zp2zC
	7vKskmGKs3mhF18V7oEhOul44eXD/zbThsf5DcRifP6rlocZQo2X1aNiyfapL3Fk/FM/pBb
	/c+TXDYxfMjbWQF2RMUv9fBG9ejDS64zCS5NcaDhLE92LrWLqm429n8mMuzrxbXwpag05Ik
	F7f5L8DzQkYoRFeDONoaI1Az/LZRNhK8Fvj4EVxuRFj3SsO89yG+vtoHXIbH8ukruinoV1A
	5HQr0uqoXhLf2dM1ddLxJh3ZlB6JpecJcFH3Ffm9ZSyNXNNNTuuRIOZtzOZrIvlANZNQbVD
	IcrSTeKewHJYJKOmsyLW1h1L9Q+P5APVjVpcrVFjLDUW8uYsG238KCLhs58+s+G5VfP9o93
	FNFVM6HTy+J85rqosKa8MDuljfBpYJ0I9hTLur52J8U4ZeZF1k/ABtD+WROGS+6tz5sS4b8
	g3yxj/8KHdo6YW0SJ02dV2yTvkMT2tcY0Z02QqS65VHcyKfnpHQ5xAGfYLBp4imw3nOnnyF
	PLD4HpPG7gBp5s65lpLdgMNMgibjptyW72SuTCm9zgVXGyl1PcW6ZTzFxbhrTVtwh2l3FYH
	PvpwqsiZCBnHJs1Lr0JyblMIW6RqHqMzpHtLs9UOxGWN7DssuwvSyYqOnVj95tMoMXuD4x1
	f8eQre88bEEaDULD+YMHn4XMVfkVE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

#syz fix: gfs2: fix address space truncation during withdraw
