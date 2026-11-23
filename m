Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465178;
	b=iAiHYi1gMwNJpiguqH8Je8IVe8fqPE/v26DVomHkT1x7PAWhqAN1HR9rg78wCAhDlgJB
	 o3h31jxFc6N7NGQXXGXXhnN09UawvPfJ0c7pbGJ2aARH7SrKywCMey7XPji/pydOdFDZr
	 og44civKlyBrdQkwnQ41gZ8Gxkr4oeQS2q/5AQWu/Mk3GCRFj7+5RfIzyFVF0FgXTaz5+
	 GEY0tawfpwncebYX9DqC0jIVNUomgnhfRTCOVJSKBLKdB7oJBKlmsLIR+AU5SRnR30g7G
	 yc5qTkN0Fk7R7Q5Eun1JxvqQ4vKirLOF2PzpGWm3q6+4gnQPd2Ea2wMzbFECGIYm6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k9JvOVz5fdfo9Ol5UQWej8qJ9KZGY8CDn+BGwa9BvBA=;
	b=kZH2IATkBHz5JOIj5a/EnUBcn8WXnvAsjLjgFaWNqXSUpyc3J0nKiY717PymLKLq4buk
	 WIKf4oAFahZ5Vvgm1UtT9Kd3HAhJfHMvqpYJ2rk49roKqK2rJmMlJ7FYrtVzEfb8Y87pg
	 5jQyYdanZgpovTUGkATeNAVmS3/bDym0xGiAJ/0RSI/GTg3zom+surMtcUUvNN2tAowvl
	 uH8Qk3YhLFThsoy6ZszCNXIf0Tlo5P5tdCSGON+i6Sl/Ukjh5ZHTM3c2brw48K4IH4paY
	 rFSmpzbpsIpO+KL1/XHNKETqYVh4FvrPNsPmKiwAu/2aqhM1fkV07GFs1xmtgIYlHQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lgUJfAb/";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F91606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgUJfAb/
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so5205691eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465177; x=1796069977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k9JvOVz5fdfo9Ol5UQWej8qJ9KZGY8CDn+BGwa9BvBA=;
        b=lgUJfAb/vyxZQ6/b6tuAVyFytFPBYr8TkJTXTys3zhzRbIAxfR9jFkSb7TG+uPZZef
         5CGy6n4d+zrF2erPnqe7uVws1QY64qO3DlQWVCtpZQIkmy4qTeKPeJ2VMi1M5oiDbg5M
         QM7ceSymN2Qarxo0SAbtKcG/FRVWqF+cArIml6tCkIt32oLIThKRYO5Qjavp8hzzwzv8
         klTkxXk4CG0koeX+RhBwwgLsy2QjQrMaMp6poSckzPsWvoR95dCL0vVvqmBn+eYf9e8R
         CJTys15HmCdjcNciWuVwodHuErLtMRA2+kphH4EDWVHopgQncYQu0vFpKPxEhgliqlAw
         L/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465177; x=1796069977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9JvOVz5fdfo9Ol5UQWej8qJ9KZGY8CDn+BGwa9BvBA=;
        b=iBLeoI/E82w3iXiB/7hn8E2U54UdVKUFZg6oQeDonmlVjt2IoQJIdE2hTTpTrmeBRM
         W+pxnm+zsKrC4ZCk1xdSbUvrdJYdV5Ji4GoqzQFfxgDdwrmetFUY6I5wFHyH4KIzOazJ
         cYe5tTFQ7UVmspY/M3FZO/ZuSew+XOw7EvUZJtyLM+W7ZkLwL1/WPmViGGVk3Fs3insm
         0FIskYl9nUeZHyRfvOCGfFfdV44AwXcbBl0wq1tgf4aNlgSI42G5eblzYtOB+6dkUC01
         /vf/aLcHDO4ecfqoJ2zDHh4O5LT3kDoGXxyV+hB+xx1ADBietVm5oufo311GMojoQ4LO
         zl5A==
X-Forwarded-Encrypted: i=1; AL+hErENYw9QDAj3w6N1IUIqrGImBv8EsTivIqSWjJuVAcv5BP1UFn9hwMca5PVtSo440eRs5jTsiBeRYimDf9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W3ITNw3fhUhgD7zuSw+uLFJEYBWmAk2sw9+dUG8wx7smvrKLj
	eUCK3imUXl7jZWM/zLJMUor+ibmyVDe/zOUYmqponEX8gqEHEXCmi1iK
X-Gm-Gg: AZFdTZdJ/bxaduQIeXviKoW7uEShvPJPlScKpKFW07VJHL8JbsFSt4oyumAWJVd/+eZ
	tbWJ30M3tMZ+Plnyz7U3NrHAZqSbc5FBHYDf8lFZnK5HqlBbL91LVmcvf+Z640Uv3BDVhQQFVxe
	fcrMyggO1wAPfuVu+QeRdba3e5hYddNBtgbSgU7px3cfimXQkxQd0nSjO/6gdXV01qV5ztKnlr0
	6bEoeeIYkTvm3bca35e8RDNJ58CFu6DiLsFIGCd2ydzqQKkHW7sBCpO5J13eLcjep7T9OpkL0bg
	PznXtJnajr+P9w9PwmUdA4UibZTN5EAL+DEM/WDxSETslOYX3gUKwrUcEPBvrgTjKqHIG0sm0a2
	tx7QK0dP2eILJf5pyt+NEaajAeySHQZdgn++aKaSy/TzAv5R8j7dUR/bb0kzo5c42rO+tPQsUgJ
	efR7BLhs9sRwZ4vu+IbYFY+gwB9QV2XXFvVCEu9ulnLlg3tN2bOSSVWv6C2UFrBBEURWPALffyp
	ZPhX/NaAJ0MvHC+1XXG5KyGHKEoKi8ryt+GWBgxQ4KE0eOF5r/Ex5eFKoowRq2rNTSX6Q3gwnmR
	ioN527WQAd3lOcuV5LGYDOhhUgoi3aoHaTvQQTK0a/q0ahKUEiiE3yFZP9FMH77i6ZAkAmM=
X-Received: by 2002:a05:7300:ce93:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-386bbfa6402mr1219667eec.32.1795465176733;
        Mon, 23 Nov 2026 12:19:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44019037eec.26.2026.11.23.12.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:19:36 -0800 (PST)
Date: Mon, 23 Nov 2026 12:19:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Vojtech Pavlik <vojtech@ucw.cz>, Greg Kroah-Hartman <gregkh@suse.de>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/10] Input: stinger - zero-initialise driver state in
 stinger_connect()
Message-ID: <awSf0LtS9H2o_hWi@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-6-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-6-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:11PM +0000, Lee Jones wrote:
> stinger_connect() allocates struct stinger with kmalloc_obj() without
> initialising the signed packet index stinger->idx.
> 
> When serial bytes arrive in stinger_interrupt(), negative values of
> stinger->idx pass the stinger->idx < STINGER_MAX_LENGTH check and cause
> stinger->data[stinger->idx++] to write before the start of stinger->data
> on the heap, corrupting stinger->dev or adjacent slab memory.  Initial
> values of 4 or greater never match the stinger->idx == 4 reset check and
> permanently wedge packet assembly.
> 
> Allocate struct stinger with kzalloc_obj() so stinger->idx and the
> packet buffer start zeroed.
> 
> Fixes: 17dd3f0f7aa7 ("[PATCH] drivers/input/joystick: convert to dynamic input_dev allocation")
> Closes: https://sashiko.dev/#/bug/linux-bad333c0-5b62-4ca5-ad93-204400bcba3a
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
