Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059304;
	b=qvgf/yIRvtER8AUHJg6lecwlVXCrrMnGeBSQYdez//bT7ISz8p5hokuFVvemfJ2JwkL3
	 sIjMCPi49mGa8jzkOBWUtfu/0vDvaUfzYe+QB+MBOkCBrKi0D1m4/llbgwlcBgBSOjRL+
	 XcoTlQU0jn5xPkIGfwenL+nvzGgrB6fEeoAafOTWv4ETm6xpE7QCe7/QWZ/0q6ehf0ByZ
	 x/zIAGsnMtuB+ZSO7UKPQntRr8Z7J7TXOIMSZkaQerZYzFKWFy9nL0K9eBpA5wI6zSd24
	 SBws/3PEWYSFK3xaE06I51at6lmHmufd2v0poxPBM7ZxReOzitxCHqsxyBVQKVIV4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059304;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jXqOSrBHyoNMypm+4YkxNoEiHVim1tXk9PxfuM6KVDE=;
	b=JYnRBnojqke64NQbzKVGoeUu8YkS53bBUjgG0SGeNsMB9QYFnGbYuW32q3cUQothmpM/
	 FBld7Mh1HjablWw+07+eSAMdquTzI6RQjx8nuhLvacNJRuIfzeDTYNh+T5P14Zah8Vqdc
	 yLjkuZsVXqjFabzu5UEuvCSy+icKymnz/AiJJ2z/XDG9glorja+x27VSCXrZvapg5Axv5
	 IbrcbLyJ9xhOtkWfyyEb3sfo7PUipBw+I6/7OAQufkllNt+PAbCwUth5I3BxdAgji1h+a
	 UVIe3oNi6A1r0LAdLil14fWO4C7k1C9kHtCPYudyS++CswJ7ryTNjehiKaBtPyMbevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LWpZE21y;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24471606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24471606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LWpZE21y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LWpZE21yj5j+ZFz++Z3gRopNAQn72Jd8YDUyF7c+mO1t9JTlYehPlbwk6uyQhO+OHnT8uLsOzNpL4
	 SMb9xFwzPiKsMp//jr+eAPBsWnWYmmFP+24qh3KQHKmM+KDla9sY2OxchxmF7dtqxOATc80Vy6nTOG
	 RA/QesURldkoZR50=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afe6e62b2f-166db;
	Thu, 19 Nov 2026 11:35:01 +0800 (CST)
X-RM-TRANSID:2ee56afe6e62b2f-166db
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36afe6e6415b-0728b;
	Thu, 19 Nov 2026 11:35:01 +0800 (CST)
X-RM-TRANSID:2ee36afe6e6415b-0728b
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: srini@kernel.org
Cc: rafal@milecki.pl,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: Re: [PATCH] nvmem: layouts: u-boot-env: Put cell nodes on registration failure
Date: Thu, 19 Nov 2026 11:35:00 +0800
Message-ID: <20261119033500.12196-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <1cdf714e-50fb-4ad9-9d1e-a5e878f381da@kernel.org>
References: <1cdf714e-50fb-4ad9-9d1e-a5e878f381da@kernel.org>
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

On Tue, Nov 17, 2026, Srinivas Kandagatla wrote:
> Missing CC Stable

Thanks, Srini. Could you add the "Cc: stable@vger.kernel.org" trailer
when applying the patch?

Thanks,
Zhu Jun


