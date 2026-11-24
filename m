Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501587;
	b=3b/aqyVk5olVvJabw3n4N0iGZccOgU25CS2zJ9XF3tQhivS4B2bmzVhART4ApeFV2kvf
	 1dqflGvj88+k1FP302bY5q5yElyExLjyxWlbBpdsYwYZMWi09Kv2sC4eAl+PQXhVQrEK5
	 WP6XKYX6XpzVE3b5eYBUeXCcCocCkaAbBDHQw0NuDc3EbTMwYnicr3Obznq84Ju9yZkA4
	 0tU/COV+Ib5uVf9Qqdg7oFhP0GELt9M3nJ//RH2rmrULuNwZXryqwhhQnb6ofRmQfA4AY
	 OG5ImUfAuMXWasYa+HR8ePjXMD2waIeJ5L+/2FzEDqJRo2FD1SpnuemQectM1xjFLRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
	b=JsAzFxiT3duwwwgQJQm+umpfBRftD6JKYL+8MnYpd1X1nIA1xDp+CPwq2HdsD2Fps0o3
	 IXQ5yJjmoiCZkTeMEWkF21izX5FCvujZ2At1WCFNjMdER7XzO0Jk52yBuczL0iqGsdJ/c
	 JApKCsuwjXGeA1x+e8rpapVc+D1c3z70+iVeOJRtxHn7u/86le2PBV+A91cu4K2MsGSFm
	 rzV+QufMQ6mFPWOIdplFsSGJBjouJGRcYrO+9pIcM7r6BJv0WG3HBecQBH/d6te6p4slt
	 3ad3ATL3OZ7+aDr47eB7cAKElAaUxW8JS7sqVc5uTQwIWNyEnOT0VbZAqp5vDdF3TyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aw2NmU5m;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F42606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aw2NmU5m
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380c28f9e35so5318761eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795501587; x=1796106387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=aw2NmU5mXIfml8zWv2yXkgGBsdqu0t1jHUU7WofPUO5XM93i9Id2hMdudHcF3xP4Bt
         gndhdLLj6iSmZdDlUp8knzGn+AjdVC04G8TCXIkouk7gAtkgCiqZjbo9rb7A+4YpLG9i
         DTFhf1W20CWS11DtXdXNq2spKqNYuLnRGnvSO8k3QBpTskFPW+4BL4gYYq/jVZut+zKY
         cabPckCi3C55CjRPgcVnzV+du220fYI7mjU3ydGU0p741gRVqGFIapvLGQURFOOfv3o2
         4906pe2WYq0QGwkqb83H1VMVThVX/wRgSWBrTpCk8CI/c7B1BGVD2WNXvBPsmK2Kc3jr
         bIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795501587; x=1796106387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k13cl8AnOgXOYxh9rMCZd+VqMKK57TsIjB6ASgYtOw4=;
        b=GFz+TDTQsMTxVxRbY5K1/m4ct9CkvKJxjxe9nr7De0m0BU2wEwO+Do4ZcPMJ6aDGhr
         CSIaIia7VqJjUCM4kNi9w8wzKiBO2KvJq7lMQwd82jsBXv6YyjLMI6tSsoq/64NTJGCj
         QuY38wZIo5ZxFlQHB0UhRRmF8+jOXHqGQ3g/zJxrMfY4WPxJtLks9056mRfBxHykW9RL
         ljy2Yj1zZzKVR0+4gfAU4dTOw9fWY7wZZFM9uLvjLLhJv0jO2IQAGMPdnrV6LQCP5ufI
         eldX4FVZ8I/CeGrfspVGjXI/lJqRyKeYtrR1QndbHK7//rCFHUI9mhrwQJSh/joGAsLj
         z6yA==
X-Forwarded-Encrypted: i=1; AL+hErEi8JLTFDSVR/6jyeByuJQ1QUftetBCTL2qirLbLYsuaIAz8nQwhc/paK6azkGkJRLQ3vuMPsPtEWehkX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/NcRL6lHw97U8AYk0SjyR6hASNbwm1zntNRy6acYlb2kV8l20
	sFxYGhbHognLl8PlI+7Hej36p7hRtNG8fBfULAN3x+fKD3e0L7EKIKur
X-Gm-Gg: AZFdTZeybmG9TaLZNw1FJYZuwcD6zczfwadvHIKcdih6MO6eNbx5DUge8Cdpd9JSTlG
	A4X4Ee30cABmjEpMYP3pjXtvkehfibTvh4TIzGChDT50achMSDo6JqlLFztmUR1fEPR31t6LJpE
	9VEOk4/F17th4X5x8Vb//1Dj3ig3lTAaBU6DlxYW3OSKHZm+6lTRfaAAvJn1EAQGo7EdmIHWph0
	fQkR9hNy99ZB6tHPi/HXRqxhZhZNQZuTPR1d9E3IVY7K8EU821UWlMZEXgZpkOACg7wyODFuYbO
	DLObDPhkXjb/jH6PyZiwbhWnTi4ZzJjq9ZRqGZS6z05+tSxe7O5FwvYuetRf1vzXNEdqrC/Cw/D
	iMmDJxjyysD6Y30+MQ+2LxEcsesY2jaNORhkDPuB/RR4txdtjkOJotUfiuH1oGO0A3L0LJrAHLt
	huwzwpnHw17SM/I0++rap8K7VwHtkhbZVb7AX2JxoO0BE1bW08NQ4buC1HqN0jFB21A3SSVmJ+6
	YePApMcuFog4XMcgG4cpr9+zcRNXEI8EQdfOBwjS3LrWuj9iv9S4BucNTne73OWXq0M4kVyCRIO
	CwjI4LeRof7391ugAx+mqaeFsJHfkReqIZ1yBF1D+WgKFiHZ1H9bnbWWMxaG/52ZRZlXTCK7
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr6427409eec.27.1795501586545;
        Mon, 23 Nov 2026 22:26:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm72739389eec.3.2026.11.23.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:26:25 -0800 (PST)
Date: Mon, 23 Nov 2026 22:26:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: input: mediatek,mt6779-keypad: Add
 compatible for MT6895
Message-ID: <awUuAzGu3ZoADKyB@google.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>
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
In-Reply-To: <20261123-initial-mt6895-v3-4-95c46597e63d@gmail.com>

On Mon, Nov 23, 2026 at 02:18:37PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Applied, thank you.

-- 
Dmitry
