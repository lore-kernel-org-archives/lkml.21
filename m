Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990208;
	b=341VhX33BTV6zdysJJsy07pLxHGGQUr1cf3K55bCVd2bfnNE2ar8x6AUXzn2R+QMf9zU
	 /ztIzdEwdlWS2EQsb32uTzBtkOSPu72SDwexyLYB/4CHCumwhbqfuH4hZTqTg2eWRN7/c
	 X/EYKfm5NJwwLjNsmsYncmcuePu8FcMtaTxGRcPwA977G8knX7o0ufHhTI8SMa/zhyHVW
	 wzzhFFG8EPqGPiMPqNk/d+b1sW1szFTq6LX8rEOpGXmhQqRqPm5RNBTlq4d6LH1u4E6jW
	 ymVdiKmRCk8VoxebQXqyuxc1UowdYO6oIBS6Vohuu7MwUkqX2qF++i5VlFFa5Kwqfeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990208;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=UTphvKG1VkBAe4OOzHUaXPtgSB+EVymARbj1PARFnAY=;
	b=nFCkON87B+QfvgJ5j67P776lzrgEflaZ1+Q/Kybf5nRK6nhrxRccTH9v++h8l9yjlpos
	 6gowoUHQqWgyZazHL2Upu1u95YnTq4eJuD69RB+CircDh3R4TkqFEQuuMSWfzNjU1QK6a
	 6FWOoL1i6+aJkX3iMd07xlWh+6euLBpuWhlMdksJwpP2LcR7bXoHNiHkjzEkJp3/4ekJx
	 qsduLJxUJJfsXvZho4lKz7GClsL7rZ+OLG7pH70R+QzPWOWqjSgR54JrKaIrY7A4cj7mm
	 1ECaQSxBoyf0OCtMFC84YL35DV+YgOwD9pZmUVdfVwqYpn8wR54Ew9XiipfIwzRANCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7355B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7355B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxLNB6YP1q6cAgAA--.875S3;
	Wed, 18 Nov 2026 16:23:22 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxlMxwYP1q5o41AA--.14731S2;
	Wed, 18 Nov 2026 16:23:13 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Fix off-by-one in bt_address() exception
 vector check
To: Huacai Chen <chenhuacai@kernel.org>, hanbings <hanbings@hanbings.io>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>,
 linux-kernel@vger.kernel.org
References: <20261115193107.571674-1-hanbings@hanbings.io>
 <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <575cc834-aca1-a38d-3db9-deea93d0d2f6@loongson.cn>
Date: Wed, 18 Nov 2026 16:23:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAxlMxwYP1q5o41AA--.14731S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=

On 11/18/26 3:36 PM, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> What's your opinion?

The code looks good to me, but how to reproduce this issue?
Otherwise I cannot test whether the issue is fixed.

Thanks,
Tiezhu

