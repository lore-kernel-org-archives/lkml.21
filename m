Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697226;
	b=IQwiZTLpj0mZ511bTEr/h/vIfkRs3H4Pc87sr0QAQDeJoaStRwXX9OJqC9YxfD67grnm
	 LnXEhFZUASvL8wgQn20ZtVNgqNPxuS213TibKwEXXJcwpz92b6BA1aabsSxKV+Rop14qT
	 cZidoo+OQQrzyLqVE3iiof08ncmM2aNCJSLeEslQBffWpSTbUke0k4HsB/J4MnYJP6ZKt
	 Hd2BeQRB1FVjwYqEkrWh9mhMjWjiW1Q/mW2wik3QqvTSr7tLrGF9kNcmRdOV2t4KhQRyn
	 BaGbGjYZAc7sq7mdgmACAfmdCH4o7iTCBDtkv4AKK0LpnZBGu1mx7BVHosBe+fmOc6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
	b=iMNYIY3+77yBW33kz1nOkMgwe3gMKAJyFlhJPIHTXxmAo/82SeflV+pg/A3SBmlwuSCL
	 6ZpL2PICFxtC0DcbhWfkmR59O4oivpmHPbwetWlyobHUcqMqC6JasoimrIQ2l8PyjktK/
	 WiGHCYMI4coLjFn0qF7eLFAySWC75CjUfVlbJT2m/SC9rcckgU1zqXkC2wWU3hRrBnHO6
	 G3kuxRPHD/XIGLVXWXuZddaDP2+NJkPombMElvE5/fMGLNnq192gzThxjVH2abmRUVlXb
	 yZHohAvcxrUqKQJFhRlXU+2Ei6tKJuIAHnD4M65Cbz452GqV1gvm6Qvx9e/WaUZ/rqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=EQ7J7XaI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=EQ7J7XaI
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1afdf5196so2725466eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697225; cv=none;
        d=google.com; s=arc-20260327;
        b=MUzEn5PhFXkCPV+3+Ze9ZsDBIJrx+GQNCkIOsJz8NvbI/n2HaR8sWMLvxm6c2cVv9q
         PHfdMvL81Ra6rHA1ko/wT+aBoGc+EuyCRjsdeOGPtfRjfqAMs4EXgk+ncVyYFOxkHpTF
         z3kNVuNTroqU6uGO3/LLwXMyFDgd+W4tt/Il0zoSBdhRZjUy82rUjh0e9ej2/a1TXhEi
         +fEwPD2vcHt4McooL+YqWMajMTMZJuUFbLCai8BmIu2Ge96a31huvXQJMaqxyxemEh+w
         6KBvdgUN/SZoFezlK8EBJHTtmgftCoojKUJe3PJ0vv+1b8ZS1wIpJyrOZgaP/djXAttx
         auQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
        fh=bmAjQOyRXbpxv5MWukAJNEUmVi3zRyXYZc/TyqtyFqo=;
        b=k513/TLd7STI4xLk2UBJS9U0dv/XZ32h0918uA/+wXgH3a6kEUm26Syswfgd6DOGYA
         QLpireNNCf523rKL/cMP1i3VdjRE96JTPLCwemyzpi3r3qkon7Vbgq2YU2N8Qi0ZyZ8a
         ezRg25jmEO/MtwpGerXjAIaVQbiauOvP/eRfURp+WP2mCoQHSyd9RVQQrU9SVZQCSvqw
         FW2fuxK9fmbmZHBIwxEMJDgiA4Q0gJKFf06evrl6jCIYfbkwoO1Zqh/YcslpaYrZjk/J
         Libsfg07rG7TzLgePG/Kp1w3m1UMtBxu59es0/fBDCBD0v9CQETmJDYyWzC7a8KMwsJN
         0WBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1795697225; x=1796302025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
        b=EQ7J7XaIadF3uAn4gbGhDW9T79STu0JpBcKnGDPwJMdcYfp2vzoJ4A3jFOxtwEDQqp
         dojXRykuli4jE+05IotP5k2+v+UoX3fCRGvkQg1TNhJMZWlrqhOPq83sBJicQc4pFHt2
         /cleHU92klXpCLQCARLmfaNbraGAaItzY6T27iQIKsRh6G8Yf0L7y+PYNwhxGG42LuvG
         YqEIdtE5gXippnFoyU8kI+xk6QL+vl8rwIzufLbB1GrLfLqKbuBo8Zek4uVaddpq3xvg
         LuYEULMIbvaKfNsFn1u3pvqDrcI+/vEqpPxHzAIRwIIMCSNRDGj5FS87s4xkEfqOdC85
         wZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697225; x=1796302025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0sDCO1ovM17uMu/VOcrsRpcY05yXe7IWxHNvX+k7W9A=;
        b=nu8jIkbSA/xEqeb/7+M8wP/gSSwiMzW2FbNGZUK/MNYhI1J3QVW6sY0UNWdJUYuoV7
         oht7sF1oGmdC2LyjVU+GRvch2BMwAOCiCyH84sNQxub5JT6YHxccg3S/Xg0gJ7yWwqX5
         /YRpaF0PrfR0kz3KHt1MbeD7NCwyZnob0enTHGRb2c3PknbRa81eNPxoyQREHd74dHpD
         h+ye+1x32Ghe1wm2P2nw+MJWH0LpyCLfgKbUuB+AZ9pEmHndy3ZLf1AS3xkL2g6Yx8ww
         JA8jtCsF3J1eok+tocoLkp8LVrYCnSQ9ZFcsqUxB7X5keHBb9HZsOs9Ohh7VIAVGe5Bm
         bJWA==
X-Forwarded-Encrypted: i=1; AL+hErFsPyRe0pvoJV+9p/rq4OpLcYB8uro2Jxw7Hk2Z/NhHnfAtNm/ZiAzqZr1c2qhOiPgHdHAmOYZmrIKEF0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lLX0U+rjmgG3ELm05i2MvOh1fFAJCiVWcPuFC1RjFjK9j8GDS
	DTN8WBdYoMt2fxo6QIL2LN0B0lPr1zu8iHopPw/qUtg1aXZa0/dd4GiiLwl8cr/b1++jTybuDGU
	Gq8XVktYvOnNAO94/AmVKnAB08dR+V6EUP9sWqqDjGA==
X-Gm-Gg: AZFdTZfDRHOx+rofkeDLe2eilZQnkOhUVN8hEpR0BZ6PU106WrhOHqDD2SnqzFENyi4
	+ZIrnlHs/wcWVrpt7YFRhp4rRSegXvSxJOrW9G86Nq+xiIwxOaS5SoGTUjuIZUS0CKyEm0be7XY
	ttyfMIFOwV+PgRe9f7reHTJhTQX3v3STB0X3Gse0Suu1WZ3+7aemZ7Ye67Jlb5kh9eBUJ8lBgGR
	6I/Bow9YvBx0f76i2CBMZWo5iZyTBHu0Kp1/4GhnbPLPEuSRHjmCYFy9qliGj4hHLAKJNJKjcsk
	v+mWnBrR3A/6BY7kYJ6hwEL+SZUG6YlSjREPof1xcZ+Ek/S2zCgNHhKxVxrYtqx+KvZjAc8UtdT
	iqQCaEFJJiXcf5aprQ2LZhw9fFjx501ev4FHj3U0K6PFiyEZKKNIobS9+ebb9OAcIH4wVaJjWkj
	7SBuh1qMRpVus/DXuZoAn4m/fGjUlkGhBYJK7vvZ5WzP0X7AIqbYwzZxxf29i8XsOwoWSUNgsN
X-Received: by 2002:a05:6820:55da:20b0:717:da:ba2d with SMTP id
 006d021491bc7-71b3949694fmr12426690eaf.42.1795697225084; Thu, 26 Nov 2026
 04:47:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tdx-guest-quote-poll-v4-0-d89f26854b88@flashbots.net>
 <cd7bd4428398413e16ff214fc46f5d65076757d8.camel@intel.com> <436c641a-9d35-4695-b41f-547c46479a5d@intel.com>
In-Reply-To: <436c641a-9d35-4695-b41f-547c46479a5d@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Thu, 26 Nov 2026 12:46:52 +0000
X-Gm-Features: Aa3M54qbjy628W_XZiCsTaWPDZAxjlqcXQ_RCIdX0UR7G-Q3f0Ja4RKHzIf02Lc
Message-ID: <CAKV3HMNoCbBeyAsH-UHHC2wWm5fE7ps0mo_E3TKJw0Vk47W43g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v4_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Miao, Jun" <jun.miao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On 11/26/2026 5:42 AM, Edgecombe, Rick P wrote:
> I think something went wrong in the send. All I got was the coverletter and it
> looks like lore did too.

Thanks Xiaoyao. Rick, both patches went out with the cover letter and
were addressed to you. Lore has them in linux-coco, kvm and lkml:

https://lore.kernel.org/all/20261125-tdx-guest-quote-poll-v4-1-d89f26854b88@flashbots.net/
https://lore.kernel.org/all/20261125-tdx-guest-quote-poll-v4-2-d89f26854b88@flashbots.net/

Maybe a filter on your side caught them. This pulls the whole series:

  b4 am 20261125-tdx-guest-quote-poll-v4-0-d89f26854b88@flashbots.net

Happy to resend if that is easier.
