Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617367;
	b=bYaH82qKn1EoS/dEe3tp/7SX3Ja9Rvg0WuW0GkhKlRdv8/xY+Dc1yYdgyFbxZyTeRSLY
	 9yHDxolS9La8xdN3TbGZ/ZQni1Dkge9Ft7s0lEswDhtUQJBr9dXd3guPZmMRV2LCue6Lu
	 kmdiftOG3cQiVm9RmHjOti4oUV26Yw399mcuZihxdXr06umV2QGj6C8H2MDMuH5KFGAMm
	 FzweZyNjfsiQgUbWoiK6sv+e15wX3MzIDqXNJOilangVdQgsd9KxAykEFzwYfbvziB1D5
	 DEnw7yKyIPsh6hW6oKANFjMtLfsVYc83zmugVw5o518a3leD8hLIJTLMPfsqfrJ2Zzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617367;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Q0ely9ri0vX5jj1KTry1tH7awMzrxFIkGEYiasrCfyY=;
	b=IeyzbXe0hxSwgiy53L7Q3jhueulNj8Efy1H501FJIGhwAfoiwYefs7vguS1+YxcD+Jfl
	 9Lly1CLOOoQnebqFQeQ2e24nzsodbVFB5TJOHYM+5N3jH/6dH91bH1T6aixOrzouGjVOe
	 lVpJDNODQUXZawr6zj3dQ+fgCmHS4fB5CN6Deh8ZTysCGO0Kb8smmSTv2sayUSCzt9ejy
	 Z1sNw+is/8GuAaSLV3waseuZaeEUZ4r3pQJAaS0i7OMVQuKLhzjr7go89IO1gIjsK5ILw
	 UZVOa7I/Gq+ZqWq/Q4Kw7e3Xxqu4NQ2YHmiDViPlkBlHkxrL/AKbw6HC0NUJBFUFmzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OXX6UiJj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6826F606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6826F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OXX6UiJj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE9002F;
	Wed, 25 Nov 2026 06:36:03 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A9FD3F632;
	Wed, 25 Nov 2026 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617366; bh=Q0ely9ri0vX5jj1KTry1tH7awMzrxFIkGEYiasrCfyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OXX6UiJjHgUjLi9PdeIrZOJIIxrLkJ9W442YBfNJXdr8gRKX31p+J5ov66DVbLYb3
	 MD4H6tihgKZsOBJDV25z/m74xo1X2Bwq4sERNM/6NvlZBF4mGs+URA1OxHrUygBWIN
	 dChn7skjm6dluzRC6lTbWd3BjNsjBb1v4LDcmua4=
Message-ID: <df37534c-06b9-4c59-80ad-fc7f8fc395d3@arm.com>
Date: Wed, 25 Nov 2026 14:36:04 +0000
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
Subject: Re: [PATCH 0/5] ARM: NOMMU: fix PMSAv7/v8 MPU setup on M-class
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-1-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 02:57, Brad Hawthorne wrote:
> Not fixed here: on M-class, pmsav7_setup() rewrites regions with the
> MPU on, so for a moment a region has its new base and old size, and
> QEMU faults when it covers the running code (an385, 0x3f9000 of RAM).
> Turning the MPU off around the rewrite works only where the default
> memory map matches the kernel's. Vladimir, how would you want this
> handled?

I'm afraid I need more details on what exactly fails :(

Cheers
Vladimir
