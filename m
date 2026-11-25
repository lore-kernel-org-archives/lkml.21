Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603845;
	b=JWfd2cqfXWr5yLaACJXZ/eVz6S0SyyruePaXL6crlgvqVyrmTcMusymz7OJukuRgV0VO
	 nJ0W5HnGwumh6jUBo68OcM0vcaTfWCYZJb7dCQI568Y/gsDMCeBaO3ri2BaNSJzgnmxwL
	 egdVcU2522OJ/306XYFd8hT+FQXQSN2kML1MJxdkR7V5mjzlFCmxcnRgvO+zCa9/KGhwY
	 EPc1tKG6Gaj9zYxSy0EqVV/acfaHybgvHWNGrtTsyuCfHAIsMr3kfDrdC+Ukg1YX4My4q
	 Xk4kMxzE9VUmFc1W2ZucG767wb2rm75We8ti2j3XcydO7SrdwZ8BeFFBAYeFzjd3fdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603845;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2IwkkNKIQTD9yOnGbltN35CLszZW3KxO3EpOnxWd/W4=;
	b=H2D+//cyGjSgkEeIXYoqB6VqvrnpXsHE/BAdU/FOPdiWFfYF2Ldel7TIe4lPfVNk63XS
	 mRKj4wgNX6R9Ii2H19Afs96kuf0fCn0onHv4B2r9nyguEQEigYosk0BevmjWnLoH0Tjem
	 xUrlYgDiwNnJecES+UFBsAxH21QC/HWKfILjiqkQhVcds471YBjB/f4I0a44yhmkcqR8b
	 FguTYwLkqX+6OjcfGIXVMuB1B0rUZqNfZ0e4IGnw9jSCefaRu2DXySJGN5eBb3OHD2Oli
	 2UMKaP8X7EHoX7TeuGWs/VhOW0MsrVEY3kGAAH8SeVdbuY4+/e92ETtV9m4Q07f1n/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QfeCtZkY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB2D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB2D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QfeCtZkY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 801BC339;
	Wed, 25 Nov 2026 02:50:40 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24E53F86C;
	Wed, 25 Nov 2026 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795603843; bh=4Dd7GcWl1oQeTlqKg3l9Osi7kX8i/g60nB4/6cxgqLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfeCtZkY6BAfdkyhMRtbsyiIoHuRTlJNf+Tp7a8RsIcNkMe/AL9Dab5LvWrtPE+mG
	 +hPH/DjtTjX2GKt2MrXSGjXRhT9lOoriHAlUjaHFDyA7KECtyJkM6HE2rz5zbdH+mo
	 1whno53iryrNavf6FtKavej5t3oY7ZVwMiqDl2xo=
Message-ID: <e6eb22d5-fcf8-4b34-a5d9-a68bf8bfa674@arm.com>
Date: Wed, 25 Nov 2026 10:50:40 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: v7m: clear CONTROL.FPCA before the boot SVC
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linusw@kernel.org, arnd@arndb.de, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-2-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025852.1160075-2-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:58, Brad Hawthorne wrote:
> __v7m_setup writes CONTROL only after the SVC it uses to enter Handler
> mode. If the boot loader ran FP code, CONTROL.FPCA can still be set,
> so the SVC stacks an extended frame, and its EXC_RETURN has FType
> clear. Since commit 72cd4064fcca ("ARM: 8830/1: NOMMU: Toggle only
> bits in EXC_RETURN we are really care of"), that EXC_RETURN is saved in
> exc_ret, which every return to user space uses, so each return expects
> an extended frame that ret_to_user never builds. init then starts with
> a corrupted stack.
> 
> Write CONTROL to its reset value, 0, before the SVC. That clears FPCA,
> and also selects the main stack, which the code after the SVC reads.
> 

Cannot boot loader do that before passing control to Linux?

Cheers
Vladimir
