Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519209;
	b=dWrWCxsAQ2KdTUAWiV7H7vPqMpbmUVctKwP5V1HcdlbQ4kjOTr8LBdToWO3cOtYZ47qC
	 0byAg9OsKOSPRPM+0lM2rpZVzpf7Fr0JfxjXiz9czDehBqTSLnEmjtx+MUbuFTnpw9OrZ
	 pXv+N6/OZ4H1YjKQXi0gNavN+XUNG6XMl9R0WdUkhoOxxRmwGTFd0APQ7+2Bmdw7wnVYb
	 nSIcNuaH325gMevSTFf45zAkKMd0jEIzArEZ36d7OS+mJ1jNUCFPYjvJH789XUUDtBDyp
	 lFsbLS/ClfRPgx7ktz7ShcOPJV9PV217dycDD/0cks4LICT6HDUIqHlIcM7DgN9Vvag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519209;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Dk2wXFjhpQieaTn4+8P73Xaj27BcCLp8OmiozuxND8Q=;
	b=deVZ9M1sERxsK8P4tg/jUOXGrI1O6jw6fMBBu+MJc310ec2pzhvAODG8jFXRgLPbBAP+
	 DQ2JDKa56Hu9MdE5Fk1le0Fd7iuAVvpbeZ6cjx7wdj4vLRoWe2kKOXNcTBh7wRkVTLRwk
	 pj2raBNni4VUh7XMMVEoVmGdCnf5y7/CpS+jMweCqVGOgN70gM7T+hpnRY7GVWBkQYk6h
	 qX47zT8CT18CdKVTAqqnXZXVmnRegdxJWkdEjvX+88K8qPSk0/on/GUXr1pVCbLZh/wJK
	 lrzQUGTAS/d4+EKhs6YtnXtIgU7VOT99mzOTS6JO4PQ5E2MWetnZyZ+03DwZFt3B4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZW9s1R5M;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2AD606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZW9s1R5M
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE1F339;
	Tue, 24 Nov 2026 03:20:05 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EBD13F86F;
	Tue, 24 Nov 2026 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795519208; bh=6Rsk+fNLaeVjh0mdUYBJ7NOQt7+Hpq7agfJ3FnxeUIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZW9s1R5M8KR+WqVWd47Go2kxQtGXcj6QCZlJoLpkFo9/069nWj42Id7h9TNTHY9N0
	 0zV+6jhdua2jwP0FVw2K4szsWMk+g+mLl7HHP3QQvbvYyVEG0UBF7n5HTKR8iF2LSB
	 gz5VUtma8PANIC5msgF1kyd1wWQ58zf3KCH4nrR4=
Date: Tue, 24 Nov 2026 11:20:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] arm64: cputype: Add C2-Ultra definitions
Message-ID: <awVy5Dqw5tl51K45@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-5-ryan.roberts@arm.com>
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
In-Reply-To: <20261113145022.2592454-5-ryan.roberts@arm.com>

On Fri, Nov 13, 2026 at 02:50:18PM +0000, Ryan Roberts wrote:
> Add the C2-Ultra part number and MIDR definition. The MIDR_EL1
> description in the C2-Ultra Technical Reference Manual specifies
> implementer 0x41 and part number 0xd96.
> 
> These definitions will be used to identify C2-Ultra in the BBML3 allow
> list.
> 
> Link: https://support.arm.com/documentation/109736/0001?lang=en&rev=0001-05
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
