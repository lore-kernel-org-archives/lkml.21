Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855452;
	b=1fTLxTlrxnDmicpIHVhasTn9/jXIwN46wINV8ReeocG+ToY7DxfTDQ9/wwulgweulaVO
	 QfW8bAduVruIIyb5EUW/lJOJPAVdqzhZ/Mh6TzRsxJfIDq7duBs2D1eSHp3LMt2dU+wYZ
	 J5ryNMYF3QLP260ZCBwWwc4G7AVvWyD2FHekBl4v8yDleqWkYcu5jz/Ffi/QE4xrjVmNS
	 8VVlPqAX1jNBx5gW/pJMlHf+cBG3dWkKMVjsY0CuWuT43vdbln3ZhgLPYrVKLBym/Gr67
	 4D5d463Hgi2cFuPIIyZcVdw99sSsA3+hhdGawRyD+19lVW/0vdig/OF3tU1Ju4mPJUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=R7DBXtHhJX9+8G0Ygqha5RnkE/7tAuVrWeLxmIjqKHI=;
	b=ga42o/ZdAB2RducwRxnc7D5uXPEhybDcDHcPDNv8YimfJkKU+wK2kpbc9ab7ltan7Ncs
	 2T/evxGICDTYA1hxCmaY5C5u5mSW/DraAt8+z8rKTC27iJf7Hb1M3tz9uQhBfVRjKyJnY
	 6G6YNiX2YsRFI19q7t/eL9S44XW9VLXOMQxQ1QDmJwv67xgna5SIOXhaiXcnL+2j8Gqxs
	 hnpBwfmYW+VgBu/biT5kLY4A9liQ4fwOAopNvYPRpxLvIHC+5H3QKllnmreMhCOE8PCOR
	 EbIQobd6Laxlh6S4tTw9CNNBcj54BDx2KuaSkzSFr8aXjj6nVjpZHP9LJoDGmwPkwSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nDp+MbZx;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F8606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 574F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nDp+MbZx
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so32710855e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855451; x=1796460251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R7DBXtHhJX9+8G0Ygqha5RnkE/7tAuVrWeLxmIjqKHI=;
        b=nDp+MbZxzyBPA3OK16p044cot0mU+YaEjrRAyhBNKeJASQwqt1IrDGga8FGczC1GQa
         q0kt02xIL+jRSMjWf/2SlTYo9HHNGTbXIIwq/3CxnPLWtPzdEFAEc/68wx8OKvWX98jT
         ri/H8wUwrdToly3ttVygTtmJz3m9Gk/WoMrinmWv6f2/Yh5tmcmfQr3r/NXpvSXVOpXu
         7ksfvY2z1AtB7AOvvtuc8thFhgTdfeedGnY344uzPXFa4v58V8zgM6G/ScQPclszPbd2
         EF6dhnBqsBsSpAupl/B7Hr/gZK3BvCzyfVLso+Ye9vYCRmjwVpxiX7u2rNyaVnl5KZHX
         yIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855451; x=1796460251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7DBXtHhJX9+8G0Ygqha5RnkE/7tAuVrWeLxmIjqKHI=;
        b=h0y8zJwqqvgt7KV947LfNchXaDDrbJCsf2aBToF7hY7BiD02IS9pzaTk64OYVhcqgX
         7aEWsNRyeHOcZ9ZmGW0BkM823igIgvtD8pik3Y15HXMcg7FKm65BxpuJi3EFKd1SRkng
         PqoLweZvgMqeheSLclLS4F1qCvABww/Bk1jzocxGwPeKsNZJXiZY06o6U6v1sRK6Bsuo
         or5bOiFUnt4rSw6Eu69+RJj4aHgWUuiGSEswgtphVcbZvP9CtZCRYL+0MYxOs/iirzIw
         qM46qaSzv2qZoOeOsw9yXCd1sjUGKfUzWL+xNVwwJZeOeiV7pwQgUikTYhLNgYkKx5m9
         yPLw==
X-Forwarded-Encrypted: i=1; AL+hErEdZniveKcOmFQtGTwUvtOkUdUubKMxi/AWKAHNGCP9vCzuEcKjYJXYxCUrMxTlTLRh2GoJIk7gAqqTx8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QMha73EQ+txrCWnLmFeCEY2UhFM8HdWorHDDdC+5viQNC25zT
	WHfKWFVfzGw/kEwTesDE8fqUfi4KDGjjMCnDnWmU+5O3yER35O0jmmOj
X-Gm-Gg: AZFdTZfHngZ0R/ImvtqfKhWHPzjXP0Yoyy0Kwe63OIOHZfCoJFJncQMThem2VOzxL7Y
	TFrvhppfB3wqs5WZyeFPLKC/rw+i6iLpuAnVaj+gIWvNnO3zYa46TBjRw09tEMT2nIFJM6gn/CF
	PZ2B+9sW54OoArdprgS2YWhCBmR5+xGukDteUNqtNMW/Xy52crEzUFChJ9mzfu4WBJHc2Afieyp
	537zWoPany2EGb/xBX3jZ8IRL5S2bQ88coQOrHedbQZIuRMUul/tHdAUquGtPivQQ4SomB3WugJ
	SdbzBsxp/WAZy4V2HR/wi8om08ItN9X1Clr8jkZROVHeUvkE+PF6s3t/gcwbPr0huQukSnCaeYr
	Bx7/hPsBjG7Ydimv4avWIEvnck46PZvcGbcJ0hY/X1u+y3aknoypDoblJQLD32/vlJnTO57DBtz
	9JeFRiij6dbJ0ikg3iAV8eGKhNzTVzZ1f/2R8nG4cWUvJ+BP3zUasmIUzlpT8KBBUQEexq6oYoz
	U7h9hXWB0c6YhAu2vcVkFsTdgh0cRe5bEQx+/+tUPfE8bL0EWOmDRVjamlL/QZCdp54ZvgVZVZY
	5CWnV0/8xaDeoDI0uZAWMHAfZiE9CZp+U+9+kkeYKqnGUwq+O5ZU8VJtu1Grce0Hp3PmAb1uXnd
	dVGtvNbWcf53nT48wSgT+4iRMIbI06VrqfmwJgzyiDZ+7Bdzn5GdG8DAb71owa+B7
X-Received: by 2002:a05:600c:4e0d:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb88922c6amr500841285e9.15.1795855450415;
        Sat, 28 Nov 2026 00:44:10 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm775982895e9.7.2026.11.28.00.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:44:09 -0800 (PST)
Date: Sat, 28 Nov 2026 09:43:39 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Always inline on_thread_stack()
Message-ID: <awqSiWklSdnx6AAB@gmail.com>
References: <20261012204211.3351-1-kmehltretter@gmail.com>
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
In-Reply-To: <20261012204211.3351-1-kmehltretter@gmail.com>

On Mon, Oct 12, 2026 at 10:42:11PM +0100, Karl Mehltretter wrote:
> Mark the helper __always_inline to keep it in noinstr do_irq(), following
> commit 1894a4030582 ("x86: Always inline on_thread_stack() and
> current_top_of_stack()"), which fixed the same out-of-line call from x86
> noinstr code.
> 
> Fixes: 163e76cc6ef4 ("riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this patch. It has been reviewed by Jisheng Zhang.

Thanks,
Karl
