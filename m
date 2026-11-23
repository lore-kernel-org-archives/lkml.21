Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425815;
	b=JLWOfOPrfpU0iaZ4diC9aJXV/1GuROw71vo2hRaCClRzZsfySmkdl407Y7h+uh+I++ab
	 iuFMH+69KEAoNZN5/YcYsjvpDvcDBCfg8MV0jcFYW5gekRYrepq54+YxMVy1IpkM/6csx
	 qGoqFOcWNhD7xzlR1CE9wnkX7wph+dHdWiPpbTBoSCT+sxh2iJhHJ/T3r5Cmda7BHc9w5
	 USyuyeZ4DP/XcGDWl3oFJEw1gio8UOy7mhrnflVcKtM37YsiH8Dvl9YlP1Ls4C9pW4qWF
	 Xsh1lSk+Gc6Zmprg1Fv/Ywu9w5/WJPIjVxWxZxbLqEb+iylLajft3rpGuOgAsJ/Pe+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425815;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=abWMY7ZZrLC+CqjBFoijCLowA5IbNlX6SAVuIWMzYrY=;
	b=U5ykNQWDKHlqET6QubrfklGbciTwkPD/thYnwdMnNOK65AnrIeYNWmhYc5DVkcDEsgjL
	 NxzhLearPZtohqVrQlb8riGmsx9CwoJ5CVovTlJEyC6yTysD3LZX+HWBS5Wx2Nu1qGl6C
	 esbumuh5HtV2RsRP7+WRdQu2fUQAb66nkvA1/kud/k8vPdtrbfCxbXqTsoq4UF029PI2k
	 CpA+o/00xM+7u0hIaXCld5JFfZRhLaVnsaR/O7qagNcS1RV9QeJQoRCHXsJNqfclaFXWp
	 3rTJVum2A0ObO1yOeWWhwDxxsSirViyKgtf0dALqdMjBI9aOrenZuGAw53z5jhR7BcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE517606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE517606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EE42F244CA1;
	Mon, 23 Nov 2026 10:23:33 +0100 (CET)
Date: Mon, 23 Nov 2026 10:23:32 +0100
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Qing Zhang <diasyzhangqing@gmail.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Krystian Kaniewski <krystianmkaniewski@gmail.com>, 
	Tal Zussman <tz2294@columbia.edu>, linux-kernel@vger.kernel.org, 
	syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] iommu: Fix dev_iommu leak on mock fwspec initialization
 failure
Message-ID: <awQGCKf4UGKO1bjw@8bytes.org>
References: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
 <20261107140000.1-1-diasyzhangqing@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107140000.1-1-diasyzhangqing@gmail.com>

On Sat, Nov 07, 2026 at 10:00:00PM +0800, Qing Zhang wrote:
>  drivers/iommu/iommu.c | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.
