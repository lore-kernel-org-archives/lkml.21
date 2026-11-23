Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404488;
	b=Mwy7vbJco9JiQ2Mvavicfun0vXyhmEVgKpRKperv83TD5rwxb6I+RMcvb7GE53gAAmH9
	 lGPotMvA79/lDnjYOI5bqqvk/y2jBJ9+y0ODjJEzWvAweQg3W0baoutUg6BwFaVz6mPxs
	 nCKxecjHdlKDCAE21GwexYDXHej+KUdmMUQUceQiltNOjuy0CQ/vHp1KOk2Ued3Fmmmii
	 lZCIQDSm/TSUjyk/4M5s7T1n5Zr5jzbydLIYLLhztTLHWGwz9Xh6C5URU6iY46ikqBa12
	 CeOqh08PY0GTFK2pIQ+NauXFYveYfirBCIhMRdBfa2VPCQqLYD0358F0ZsQeNA01CuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404488;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3OcNsE5BiTvJ0Z5anDFahPqafPoJf9lHCANaqQ2uhnU=;
	b=pS89Q4o5dh04eKkTozMxumx2cKSPN8yWQIEHoG1DlXwzsE9rqNEN/abaHJBalNTUedMs
	 k2e3fJVCDKPSvz8J/WbNjw/nPWQDwhTccH6FRGFWn2A+hRABV9r0AFbS5SpZIpOc3lX4H
	 d9FINsR6JBryqxt0P0/2cXFLjePTNInCxJeUqK1d0xg+JEICAyv8QycxNBCURmI7pBBPn
	 Tyrh7NbreAbtboTc8Sy7D+Gwq7qNND1+xXi0BT/to/sAMlnpUrGueXD/uwRUQkbT8C3nJ
	 +Mm8DHta72+Z58pbPLAeaHwXZPjuGwbOGFvuj8ZibWKo/e58rubUZflr155nWuJofrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=q9+sooj2;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C16C606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C16C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=q9+sooj2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=q9+sooj2XJykjEbdB/hJzjLwCP2ClJNhElJQTSjEP+m6iiHfq4JdFQy1dTZmbyMxHL5BJRYHk4D9o
	 08kdcc3muQnBnJLWb0WvcqozLwzHSgbpg/G+7Csg3DPo2Rjz/WUnbw8UIp1Ea8zHkxH4H3fVOx2ilK
	 IMfR/ayccfg3ewKU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b03b2c4803-3e3af;
	Mon, 23 Nov 2026 11:28:05 +0800 (CST)
X-RM-TRANSID:2ee96b03b2c4803-3e3af
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b03b2c33ef-84efa;
	Mon, 23 Nov 2026 11:28:05 +0800 (CST)
X-RM-TRANSID:2ee96b03b2c33ef-84efa
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dm-integrity: initialize free_sectors when the superblock changes on resume
Date: Mon, 23 Nov 2026 11:28:03 +0800
Message-ID: <20261123032803.1817-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <a0d2a86b-a001-9f82-1d08-fd8348688218@redhat.com>
References: <a0d2a86b-a001-9f82-1d08-fd8348688218@redhat.com>
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

Hi Mikulas,

Thanks, I missed that.  e5e03918fbec ("dm-integrity: don't attempt to
commit journal on disabled device") covers this case, so the patch is not
needed.  I will drop it.

Thanks,
Aibing Chen


