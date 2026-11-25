Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620043;
	b=T6UxnOMpvLeTEZubFgkCSAOyART9XyFGMuGU9k6tUQCvQrizjY5tve9osMlf//Yqodgj
	 0DlgZocZKC/6HxuFvaitcCCDVAm8awnAFJaQ0E7LftaeeyAVn+bzNWEbkOAbLfrIf6sHA
	 L+kj0BgZHA14bGRRnyPv72KXF4OYnp9SieXHv3XAwm8fbtqzTYgyafg8mTToBpOfu4V99
	 FJmJu8UUSOZz1muOOW1IxRzV123dBYzXvP0hqMofY3Q1ib51dkAkcMhj/ihLd0p6cSMB4
	 CJLCJWNVSZVwFSYed5yEWt0x/t+tQv4uM06zXy5YyKoY7dKkDNmhwbCzG+SOx1AXB4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
	b=fA7fTbrTseSODh0gtxRMFiRAcejmQCoLYKbNRrGQSIZwgKpr8KsVRTstL2Dnd+dwaP71
	 l/lnzPneGl23oMrR33VU4QqXmEWAjJrwQjypVZX3kEC8JpHWcgwjkOXKmq05doePrKbJd
	 qhYVhiqL1+rv9/wXX7Vzgcwsn//BwL5MoFSgtURyfu30w2H6lxt/mn1YegEXx6fo58WGv
	 BdJgTRJbkH5LA/YuMzNsKbssxYddLv0aWsYuAQAfbFl96jJ68r6fbUxXVXhZBhnGtRIXw
	 7lChLPliyseiU3JIcDLPe25vlc2ffgAUNag9AwjKrPWKhLbc2A3cH9WTabwOhT5ySuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPs7IeC2;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A23606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A23606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPs7IeC2
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ba863fc3e7so390503a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620041; x=1796224841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=jPs7IeC2SRkubIeMfVnhV/BhR49WqE7eahuEzR6lok9Tb6/91SnF6JgW3QvDRw9VIh
         I8NXvAazDYFAWvjL2/R5Brx3YKskZH5+t8TClG/n/H7N+mfcNGnDHTDUYE1iF4lz2sEr
         8MYzT/BBWPa8yU7bqPNSmvXOtyWTyA1wfph9fhRL7dRFWXFf+9LEenZH6NXyAJikaLMU
         w8Hx8OOb/rRljzVrIGU1RJDznnDds1VoXnAS5QjAQd45pF9bXy8nA/pg/XPK4KzKRJ4H
         uSKUl3EeuMxVaUeOXhKmwnIIrFIln8gdmrREcmWQiKyU3yrUkBvxnZ90UvLKy+OBlrFi
         +yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620041; x=1796224841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=dRyGFvcXuwsGuLSM/vGhQoOt2KvFICXJeEQFFH41rontKPIa8/N4T232Sye5W6ZRP7
         V+PhzxTvjFhayM8RN5uehpZzGwo3LB2AmtQBilFGsTQc4dOUVnPflMQb0DSEaHOUYObt
         beWox+1y4Mz39czm9v877Sxc86M0ecYiWGSDDMtB9YVjmuwzz0a3TRsvyUoCUm1r+5z+
         UfYdz4UBxKzJXQiSUXM9q/6p4J7gX3YG1PQ/A6Qlihvop0Cp5JkG8LHpASirg6mP/Fw2
         GwdfDhVKfQkz5f27bRby5UD4x0C1Eu2b6dM4tWH+mqHtO50LeyV9AXO9yRgVLZL2bhTf
         ahWg==
X-Forwarded-Encrypted: i=1; AL+hErEqVDo/UWWDPqYWZPbkNFBpgurFrnmw5FuObaZuS18g+MKsXAIeJ61i1i/dQzbMpo/VXt18ncCs0z/zCW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q2TPuPpCyJg2pPNAFb+OdJg3XeoTQD80nscklh698q6haxRr/
	gwl8M254Eb67V/xaQrCsWoDBMuzlkqX7hLbuz6Cp49DmY7PnWBbEIwj/
X-Gm-Gg: AZFdTZdGNmga6aH16RXcMjGSZw4Qlo+Nh1jICcJf8m0xAeE0AIeGT3Ukl7B/ea9YPCK
	qiWz79HksBii3afLQJa0tmaHfrYa2gDdfZGR0E7/6jdRre85FSr/7RKxlfJB5hPYY8SOuNO04TP
	2k7Kqjt4UYDCvdnmpZLQ0m8cU3GLwfN+NCs34cvH1bdYU32bqw3lTYG1NnJ2nzbe4a8liIuf3kx
	lnv3K6RcUtbfu9r7r71dnOUE+vEtZLuD3h86OSS39Rf+X2/xvRhwSspLodAzfAgAPJRWwbu393o
	5u5N2ZmYqAAayuicV/oPEJEiIhfyPgNJokulAxeZC/Lo5qIFQqDHfmDhHeYbVkSyIPj15Yn5cDV
	Mr6aDsQA9uQ9nk1t8Xz3S7YmrJEIStIqxwgCji0SRPHwphzoZpBMcY5V0wYeEOvjDzFZ0QqnbXn
	vF+LGe78NkOxuxW04SAIlDfQNsDCDbGAnMXpvqJsn4I3RQjXN7axPPp4w4mf9rlKeXLWzmV06qy
	4DkA2KaD2um6dkpRqv3qu83JEglvNgYdIpjLWZRvFzsRBxJFIBIK09qrOoutKUWjWa5GqnlgHUw
	Bnd2G/W/rugVQplQeIcJ
X-Received: by 2002:a05:6402:90d:b0:6b7:dace:635d with SMTP id 4fb4d7f45d1cf-6ba37ac9214mr15694051a12.0.1795620041130;
        Wed, 25 Nov 2026 07:20:41 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm8131962a12.16.2026.11.25.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:20:39 -0800 (PST)
Date: Wed, 25 Nov 2026 17:20:36 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 4/8] phy: core: Add phy bulk data helper functions
Message-ID: <awb8ZycWk2PJzTUD@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
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
In-Reply-To: <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:35PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Transient build warning due to improper patch splitting, please fix.

Documentation/.renames.txt: warning: ignored by one of the .gitignore files
../drivers/phy/phy-core.c:1202:12: warning: unused function 'phy_bulk_get' [-Wunused-function]
 1202 | static int phy_bulk_get(struct device *dev, int num_phys,
      |            ^~~~~~~~~~~~
../drivers/phy/phy-core.c:1242:12: warning: unused function 'of_phy_bulk_get_all' [-Wunused-function]
 1242 | static int of_phy_bulk_get_all(struct device_node *np,
      |            ^~~~~~~~~~~~~~~~~~~
../drivers/phy/phy-core.c:1274:13: warning: unused function 'phy_bulk_put_all' [-Wunused-function]
 1274 | static void phy_bulk_put_all(struct device *dev, int num_phys,
      |             ^~~~~~~~~~~~~~~~
3 warnings generated.
