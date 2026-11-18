Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968276;
	b=lq96i4Fhl0mloFSRF8v+6hS4UWw5lciNVhzksCgsQeRXQMONo7mwk0jkehxofmMEjNmO
	 Nf0qJTKrPKG1jeIo19TfWaRYNX4WVgP7ANNeIJikhITpE3swNvldVqOsDLCH+a9n2Yt1w
	 gq1YICzplhk2QywR4qrDDk2YHZvVkEXxsoWEm3TFuN+QyP9N3OlGpbJaounx+ntKqhcAG
	 gjSXKZxImExaAs+KYHA4sfFtqupT+4UknNfBnEuY058T66rfkRKtxr20L81OmjvUBjdtQ
	 OhrfkzgQWlOW8hhv8kLLP66R3Wofzr77dMtdqk4u/TD8S8kpoCExj0xgmujeRl8ueNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968276;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qaePdUjFks+718aQevC8UYT9es+5Nn8vDFUrMGbL64M=;
	b=Z85L1RUJDeAdzap1qwuwR0109Ku+pBs6LSJ6Nx+HW70lx8qrlf+Hah9Iq/QljduvT3p8
	 +07APDOSvD7XJ4Ao9ew47IHn8klPKJ9H9yZxvFYghsru/a4Jtshb0mj1Um6QiIeS80Kaa
	 RTuSPpn+7HR0mqlYDFZX65tsM6QOJ+ALsMsz7+A/lQxqHZqfru8TxPhXHsEbjLmfdIdYk
	 yn00hsubTsu9WiO2sa0xmr8qRbS4/QPmRMgRHtrDbPJVmcyKLqCcSm6/IzhgUBEw+/FvQ
	 soMLBaJhdMquE2nwaWjCTwRusejYBHrN7cZyua/28b38zqmAYIxcC70cFmk6gMFE9VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="lL9uNaf/";
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB81F606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB81F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=lL9uNaf/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=lL9uNaf/+jo7cMOL6F+WtL7D24D134iWiqMJWQ4SdGJMtJW6C9bVSlZ446KRqZyiHyuRTvLA+f3TR
	 ZaEdp7OnBBb/Iw7g9kpLRKM0+wZIiSKvr8iPkSPpg2vpESlnXq958WxA4pHotK/sggJJHJkUIYlBBM
	 VO0k+QlrJBzhB2/0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afd0acbd45-daf17;
	Wed, 18 Nov 2026 10:17:47 +0800 (CST)
X-RM-TRANSID:2ee66afd0acbd45-daf17
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afd0ac98ca-c5462;
	Wed, 18 Nov 2026 10:17:47 +0800 (CST)
X-RM-TRANSID:2ee56afd0ac98ca-c5462
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: syzbot+d393ed2b27449be4992b@syzkaller.appspotmail.com
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [squashfs?] general protection fault in step_into_slowpath
Date: Wed, 18 Nov 2026 10:17:45 +0800
Message-ID: <20261118021745.1840-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <6afa2ac9.920b2b3a.148c65.003f.GAE@google.com>
References: <6afa2ac9.920b2b3a.148c65.003f.GAE@google.com>
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

The same bug is already fixed by the patch below, which is in review
together with the change that introduced the checks it repairs:

  squashfs: return -EIO on out-of-bounds directory entry in lookup
  https://lore.kernel.org/all/20261114145128.625-2-chenaibing@cmss.chinamobile.com/

The three squashfs_dir_space() checks in squashfs_lookup() jump to
read_failure, which does not set err, so ERR_PTR() gets the positive byte
count returned by the last successful squashfs_read_metadata() call and
the VFS treats it as a valid dentry.  The patch makes those checks jump to
data_error (err = -EIO), which is what the neighbouring content validation
checks already do.

The report below describes the same defect through a different caller:

  https://lore.kernel.org/all/6af937c0.094600b6.347106.0007.GAE@google.com/

Thanks,
Aibing Chen


