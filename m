Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075418;
	b=TF4E87UrVSN7JLjIZwr1y1uBf2YC1Ycf/2msg3JW0kJDtadqXpYD8/L5NWtApt1z54U+
	 Xw+ciTO9r0hDGuNKMLkv9SLIP3Lg7gubTvj1uqNh4L6EESM1voWp2sBpPpFfVupriOOt/
	 s5yuinMFAOPCnXk01i2VPw9XO2j3mh5gfqrulIO4bvKQrNAhcaSw6mx7cBeTbshRqN0rk
	 K6+Nf7y0zAdc0TX3yuKPbehrnzTTlysZjZp58d+FJXF1jJ5pUG8+Nwb4QB6nxng60V2PJ
	 vzIbvtVzovu3VqLyKNEY5H1ktdGgCwm1EwvDhQLrM3z700dLDOMLfk4Y6Ozm6plfD+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
	b=3hc7k5pW624KFwcSV46DXYHAICwSWRzwHq89CJT8/+4lABtcO7jZIqE1fqvY6WaCDYA+
	 rmk/z6/DwmaigPedFOHwULLAH4u5pQYqNmgd7N96Yvq58b7IvyF98Xc7eDcKahu7u3rPH
	 PCNxS8PZdOhb7cAZf7lAUVZ2nSHmKKjs/KchF1pg8zTT3HJnYUozldTTxZZoN/OkVTaPQ
	 NfX06xlv79f9PgD3YA7iGJPYRnVDSr6WCDbrrwEzEsi4yUbSRuB31qlOxD0Cqdp6lYJWk
	 Q5Mz1+JhtKAPY0V7EKDFWb0JIg0INlGrYLd1qvR0Wukf0Q8JJH4hv0H80yGXBfJKH1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txf9AEnn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71942606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71942606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=txf9AEnn
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b878560a08so263525a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795075417; cv=none;
        d=google.com; s=arc-20260327;
        b=iEIrmP4WgdB7LJcdZ4BRk4nmvuCQJo0uBHBZEZ/Tb2OGVn5dAlyLmh0pUVb5xoxrYw
         OwOxKhQF88WkDtSSDBe8nyC3lD6lYMt5M+7uFxuqsIunEMAEmwPn+A3ErCcwdqIMAlBe
         uUU3uTr2hx2VcPEpiqF/NshTfxXn7xIN6adHQQNgSmY3BH7koderCtsyLVJFr8PBDXiJ
         6wqX5ffEG+rv4V601KV/K50hiWsonPb+JdXHJgzmOpRUIwOmGTM0IUQHoY4ifi0YDUMu
         K7CbYgljo091HfcbdkZF9I8CtuH0RQe82c922giFwG82uaGhsAbxBrHDnkjXeqzdAS7q
         F5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
        fh=6yUunxpcX4OxugQkAr5p8XBDqhIThpoiEtmxqRIviCk=;
        b=GIqymrIqvzWfwMsw9AyHEuG234KQAXnsQx5lp12jES+u2w+8IGdgQuOq7a0u9ujEWQ
         4mS6nntkAN0oiLqdFPNCbtkReC6J0g7mea1235sGNhzamdGUNQ6Aa39ac+UmfwR+nuqL
         Lp2g4NA8x1mPPpfMbGnQlG7oitBc2IFmTpwwJZ7wpJ4N+cfP2Hazcx3w5zHA/UDG4yJJ
         XpMRyLXOvWHxaLaWjhrYOrFb+fcHmMR7A2ianbeAzv/VLOzpeSV1zdwQ83L4K5rAKf74
         c7aelYqJUWwyR/miV/MxpkaoNnigZ10ZZ7BCYwxkLbzM/ggTk/3kuqjiqr4/ifHLNlCa
         xnMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075417; x=1795680217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
        b=txf9AEnnq3VU5Rth/crTDgb2s4PApg8WmeRgoiQ0ILTAvewf+e28/4/CnBqJcnV+ZP
         E0rHclgvNTL2GCwk+A/TJorgUCWVVW/+k3La6gl7QetAhRYmRerQC/gmmTkPU/rXIiRC
         lSxMUG6Bz5tFM+tXFwXgKTfAs8Njh2aqPzVAvGWSa04lsDICVUWFBGlKQBW1GVJ7ItAK
         2Ftdka4dj5GGvdx8Hj1zwmcYQC3adrtzWh/erZc4GOvagaFZyIWf2ZzmhO8zXGyJAl7U
         eU9KARgQ7gwMAd/zzoC5i5xxACyzy3kMwPcQMjC3brX+NuCn7957iw89Es4rZn1Z0gq/
         FGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075417; x=1795680217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zyWgbXx4Q5+0M3EcfdpGNiWN2ml7oLzqm2D2qT58oE=;
        b=PVFI/9nKjf2XHmFpHOlS7LyZUBWPFiBVERumGL47In9xh5/tls96D74MDlHWc5u52U
         e0E59NKFaxIkW5vs6CID9n8+PotaXkNZEu42xA/hsN2TbKLjW52AJfT8MEb3WtH5O13v
         cOvN59tB56tEdGxAI5nFdVJkCUo0W1zLwnFqX05cnwaKl7ZQMsusFlUoQN6P4qux9o9p
         uUrZfsA1cWqkGTFZ3YbY3GXFsXJVEr6mIpZGgxlOR4whvo1zaRprkj/nOpFBTf0YSP40
         gU29y0ikLs3LamrmFUT8j+Nb/4uQ0JB2UgCAWVOvApQyfrPwVYvM2nJk7MseWhFULCFA
         AJTg==
X-Forwarded-Encrypted: i=1; AL+hErFx/SX0X1Kb3U960tnfZqFgFYI3WTXav27P894XZswSaZFgfc1J0hK167o8uE4llShk5L5SxUk+hxPHO7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2VGcOu0mqlScbgIIp19GtM5Roc7DTfeuYfeseKHXCoCtb2/6V
	Djv+frnrh9gQXDm5CyNueQK14m8Ck8aZOaUTKKDa7DVrkT1Rnoc9X9y+qsZWZdinoRpt/8Z6Sjw
	7JJUX5Gt4/KQ7TBYZIgzB/6p4YLycLUM=
X-Gm-Gg: AYBFou3wZQumDSmgevYDcPVWBELsyhaSrZYGittqKnsJuqmQvLgQupvX6gBpGYQGqG4
	rQk+iMvJDHiUvakesB11QLsNJgIV5+zWKghNqA11rb6qTbjaMgDvU/44G8YzVA3XnE1rY/dOVqR
	le6WlQERy6XkMnNlCIcoOyWyVRgGTbt0ssu474/mNCbXSYRzdSSnRyr8ZEiOAjBvqUVRwUoFF15
	dE5vRI+ykjxA+0RoW/yZYygIgRyEwPCT9PlQGIJIyZDAQDxdQyF3zcze0yCa1t7TLYW1o7ft1KY
	FITVaN1aqRUCYHHyVnR9bqT89yp56qhX7lMi0pe2ALA3MBPRLtra6fMV16Cd/wOW0o7ur4b4y5u
	Svja2BYdMB54RJuYzk/diNunHVk/HG5LdzKA=
X-Received: by 2002:a05:6402:c51b:10b0:6ba:12d7:69b1 with SMTP id
 4fb4d7f45d1cf-6ba1f9ad159mr266992a12.12.1795075416554; Thu, 19 Nov 2026
 00:03:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv>
 <CANAwSgRaHubdh8o5Zd3k5Sa_jf5fWuEuCXqbQu7gGL71MwC+8g@mail.gmail.com> <20261119-re-anand-rockchip-hib-rails@iav.lv>
In-Reply-To: <20261119-re-anand-rockchip-hib-rails@iav.lv>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Nov 2026 13:33:19 +0530
X-Gm-Features: AclHuK8PCuggsZEUPGrild3UXx1VS_EuxaX_wfHV2ilz6neGEig8c1iMSX4XEY4
Message-ID: <CANAwSgSs75e6ACaP-bw_JGJ1=VrMGmvduDCx6HMhXSmLsOJddg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip-host: Support hibernation with endpoints in D0
To: Igor Velkov <iav@iav.lv>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Igor,

On Thu, 19 Nov 2026 at 11:54, Igor Velkov <iav@iav.lv> wrote:
>
> On Thu, 19 Nov 2026, Anand Moon wrote:
> > It looks like we aren't disabling all the PCIe regulators (0.9V, 1.8V,
> > 3.3V, and 12V)
> > during suspend and re-enabling them during resume.
> > Shouldn't we power down all of them on suspend and bring them back up on resume?
>
> This patch keeps the rails as they are: suspend_noirq() already turns
> off only vpcie0v9, and the other rails stay on from probe to remove.
> The 3.3 V and 12 V rails power the endpoint; cutting them in suspend
> loses the state that the PCI core and the endpoint driver expect to
> keep in D3hot. Doing that would be a separate change.
>
Makes sense. Thanks
I will check the disable and enable regulators to help with this issue
and will update you.
> --
> Igor Velkov <iav@iav.lv>

Thanks
-Anand
