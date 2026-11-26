Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686501;
	b=m1jAEdmMNGLhR1Y91QkQ22zDDVlHYPZMhQC27COL36/shRes9B8CXnCrsbEuc3T1fICx
	 Ym3fBYWNUOoQo87ulWw40cCq3j+VpkO/CSSEkxy24y6chUsB3PNSAunLjHZx4/amBQ/rA
	 uJIJCBeFLwDpdF+TtYLqvVqhNua6pjJhf9UjnJqaI8qzu0Y9TsKYckVe5cEwML0V8oTND
	 98XrGnVKU4iQ0/NS1JyX5hBhpW/5PMICnV0+kokBQ97w0ozFWoC8Ei385ISXzzm7hbdpK
	 tOMQfj271aotVHZ4GVYJyo/pky3aa8gJahlVK5SNAgLXQnqzg8ld5+0gYVZlvOh/exQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686501;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cPOYteE3bRDXKxo0ErQBK87qKbUPRqdG39Q9wScBhTw=;
	b=g5DSWyiSd3lUXUZTStuF8OMN/dpHzwF5bb09P2DO5uNXcr295gN/xpIZpE3VjFfGiRol
	 yTRbK2Om0ePo2AiATBPI7rwhvSc2rmFfD+oTDc9Zct+3yLrLL5Bi3IvMq0XdObCCH0I6W
	 3Uxt9M0ILANJRocCHk3cG1r+O07Z4FQN5hsAyyH6oVcchuIUsYFNFcScxeP+i71fiTViC
	 tVV/7C8X4ii4ov/WAWzKgaCCWTmwc0CTXi+C8jrHjj6lJOctCFd1/7i2Pf/jRN8MT4cMc
	 4wge5h8PYNxJ29Wx2SqGoTnGmpK+5yV3F8rHEykqOlL8JDQzUXjR1HqeNlHEQJ0TXlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BIrEdQEB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFF6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BIrEdQEB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1831E1BA8;
	Thu, 26 Nov 2026 01:48:17 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B33C3F632;
	Thu, 26 Nov 2026 01:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795686499; bh=rVrsHSibW/UwgoRb5V/hciA4t6LaTTJ6geWEmfAAvPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BIrEdQEBa9Kc99fKd9c5znglbh8T7oJ4R4KuKX3cR9RvSyxyPAXHiO61FSCuViEob
	 NSQMIrxFXJLbjmhr/6PjU5ycMixvq+R+MZuAfzGL7exKE+vOAVy0jGILHtIMu0FG8V
	 kzJkiADjaA+nAFiSBgBwioSHrUXzhXeYi7zwqw6s=
Message-ID: <b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com>
Date: Thu, 26 Nov 2026 09:48:16 +0000
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
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Brad Hawthorne <brad@sim.vu>, Yoshifumi SHU <envzhu@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
 <20261122003911.1203777-1-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261122003911.1203777-1-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 00:37, Brad Hawthorne wrote:
>  - irq-nvic: the priority registers are written at the wrong offset.
>    Yoshifumi already found this, so I'll leave it to his series and
>    test it on the RP2350, where the board does not take interrupts
>    without it. For his changelog: the offset was right (0x300 from the
>    node's base, ISER0 at 0xe000e100) until c5e0cbe2858d ("irqchip:
>    nvic: Fix offset for Interrupt Priority Offsets") made it 0x400,
>    taking 0xe000e400 as an offset from 0xe000e000; that commit went to
>    stable as far back as 4.19, so the fix wants Fixes: c5e0cbe2858d
>    and Cc stable.

Can you or Yoshifumi send a revert for c5e0cbe2858d,  please? I admit
I overlooked that base already at offset 0x100 so I'd be more than happy
with revert.

Thanks
Vladimir
