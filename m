Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015244;
	b=t0Lb38CsQsjz+Ef81byIu/7y4iugXvnh/CZddRYV2/HZ71afZY9DNGNPXs1xk35UgwEW
	 s/fVDtWS28OAjQ/CtA51V1+xK5Q1Y+vQ6BGLajkPWKmTojp9dWqdzhW1K9/0tST440a2u
	 Pvuz4OZ3/cxAGfOSJXD14BGGzaZqs5gutriid5ECMrOq3fanI4tn83cuZBRhHOmibgadY
	 rIGgBMNZk+jaY7S0lozINy2TB23YDd+iCUglv7gzom1IscajlBCONPIlfdimiie2P5rQ8
	 gbfYXrm4reVy7NkKXN3bRIHiqCnaEC1iJCAnHTk+bamqhrc3jILnn6eqDXlrCx4g9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015244;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=K4NkyNQl55qkbJjnFAwd9jt86qI8on7Uk9yqZAYyTso=;
	b=HZlz/QPdHqx4bMTkvalFOqg4mcrTWCiJQXPlVMoJHx7+cisOA/7DgSLJ3OdP9bMuWdqE
	 R9Z705tYZLTHmYXYC4bn1efxaVSxIfgGOzm58ERMBts3M0nwzFj7h8QzJ84zBToa7NZoW
	 1+10NfA8RJ34g1APkfoerhIHrCvW1F6li7frI9fhHB/iAUAwG8AqzyWHvWP8QtGGx1WBl
	 2fHf+AJHTjsTONi6sT4ZbRzCUcW+natOkIpkNTAecbR/aa+1nRa8mKOWHwJKggZxNavPO
	 gr/tISsIdfKBQadLXofzQqytCCsbAVjmNsXZ41sXTNmJPRwVAyx/u/pAlXn8N4m1RzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JJ2dafGg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCA4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JJ2dafGg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087701477;
	Wed, 18 Nov 2026 07:20:40 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4412B3F632;
	Wed, 18 Nov 2026 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795015242; bh=EJfYRN3LhwoQl9ywZq/dF+WYhcJd4c60aePueCvbsdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JJ2dafGgTzsI7JTe1SkpTkjx+Vpbr8HbUCX61I8vnoAtrWkQA0XJkt51FdkasQTpX
	 KEuyMVkiahZ8/nQYlkTTFiZmEVw3xr5rL2MaWWhSlcZsDCnatIpJ742Tdt79z8pDzE
	 XNnSfdyloiEsCdIMJUixnRQRvFN0jmlqJ0D/QS8I=
Message-ID: <66c8de52-298d-4772-892d-3e43d9e7e7eb@arm.com>
Date: Wed, 18 Nov 2026 15:20:39 +0000
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
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
 <avsN0E-6_7kU3pTk@red-moon> <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
 <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 15:16, Fuad Tabba wrote:
> Hi Sascha, Lorenzo,
> 
> On Wed, 18 Nov 2026 at 14:59, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
> [...]
>> I'm more than happy to include "irqchip/gic-v5: Clean a level 2 device
>> table before making it valid" in v3!
> 
> Thanks.

No, thank you!

> 
>>>>>
>>>>> The latter, though freeing memory on timeout wasn't a good idea given
>>>>> that there is no way to cancel the respective, pending, mapping.
>>>>
>>>> Thanks, that answers it. If you'd like a patch that doesn't free the
>>>> memory on a timeout, let me know and I'll send one.
>>>
>>> Thanks. Again, if that timeout expires I think we have more serious
>>> problems than the IST mapping but I do agree that freeing memory
>>> is not the answer; not urgent - please send a patch given that
>>> you spotted it, can obviously do it too.
>>
>> I've got some patches addressing the ITT and IST mapping issues in the
>> host driver, which I can include in v3 if you haven't already started
>> working on these. I'll make sure to include the appropriate Reported-by
>> tags, of course!
>>
>> I'll post a fix for the VMT separately as it doesn't belong in this series.
> 
> I haven't started on anything, so I'll leave this with you then.

Perfect - I was trying to avoid the duplication of work :)

> 
> Cheers,
> /fuad

Sascha
