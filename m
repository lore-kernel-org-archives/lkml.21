Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026836;
	b=Stlk9abpZ0oIKK9FLlK1+dY4qqvrEycBG6vrJC0+FOoA7iv1gYxdf4LH8JNR+kI3ArNN
	 yAjeJWywyExNcU5RBlu48K76aKky9GL0QOX0HmqBzI34H/zFyyx//eyK4CCKlTF9/VNWp
	 m++H+WKOyuAh6qNwm0MfHeOcafC9MOkGhJL3G8dFsRH9sUNCimFvxxiSRNuhWDyM/EYOJ
	 lhC65MM5bJbu5naiXhSrKZVWdc+Y6IDzlvwGZfJheFgEegEgY1J1YWNh3v7oAUsFGN0VS
	 OsfORzTmOvucqpLK5U9/UiLlwtW5gQruT7JU1KMJ83oGPBU2rIyttIkcOi1tgA2U8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026836;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Vi7mH+dw9wS6ao9xyvbhD1j+T7U5ryvmcBSEHbMA8Xk=;
	b=OVSTAjDI9k8cunx2VCwqWrwn/h3Rji+MMLFNWKjOjG7fWyilsagWUn8vr97xSAHtfSR7
	 8fJcIyoC8RjLqT+w3CSYKvIdoN7N+0CR7+nb7huvDdqT+n6rxQHYA/wrUFaKyaWlwmSER
	 L8FGzoTVcXsB3avrVQdVoLjlTwCTpoVVSVaW1+G8xD354Dxw/P9P3Ij5sTQeASU+AB/7s
	 NGGElElpfMD2Xi+QSguB+5jw4xuIcwJ5KgqJ6mSKoVv56euimg67wfZb0A0d1ZRZ//6r7
	 a1n2JisvV3kixRiLKVoILC/Refm91+geAdm0n80CN5ieHK/gM93hhwYwHRPXEa/GcYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I3xtlgyU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BE0606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46BE0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I3xtlgyU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA491596;
	Wed, 18 Nov 2026 10:33:51 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9A333F673;
	Wed, 18 Nov 2026 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026834; bh=7mdOOQuMqF/9zKIPA4CkwpFW7k7ZK0oDrx6hNO8qdz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3xtlgyU8ZpQNKAqzD3ziZfwM+dwEuE3CAU5brR/WeBg3mSxXvByzEzvsHeu6CuIM
	 gSroDu+G5ZNW/8ONTMdqzptFk16Q/HccrEWrW8nlguL9ec9OzoCufMi4MVFYtuG4G7
	 LVq3kwlv9mWsfSV8CGcjUjpjI/ZUV+gWFTU03G+s=
Date: Wed, 18 Nov 2026 18:33:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] arm64: cputype: Add Cortex-A320 definitions
Message-ID: <av3vj4Tn4mX-Y-xf@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-4-ryan.roberts@arm.com>
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
In-Reply-To: <20261113145022.2592454-4-ryan.roberts@arm.com>

On Fri, Nov 13, 2026 at 02:50:17PM +0000, Ryan Roberts wrote:
> Add the Cortex-A320 part number and MIDR definition. The MIDR_EL1
> description in the Cortex-A320 Technical Reference Manual specifies
> implementer 0x41 and part number 0xd8f.
> 
> These definitions will be used to identify Cortex-A320 in the BBML3
> allow list.
> 
> Link: https://support.arm.com/documentation/109551/0002?lang=en&rev=0002-04
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
