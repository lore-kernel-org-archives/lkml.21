Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264135;
	b=dFBWmQ2UifaZaqqirChezrckwIo2mGpMicFduL5mdD7e07cfl5W/qgW2Lweg5KvtT9dC
	 l73LRyLKnWHcsPrAP5KWW2NHq9lu2tVaTMCSihfFKOFb+YRx2+eDTZy3HkPxi2L4QfVkC
	 RTDGP2yLTfieOziAbZmPqjxmFIKYr1AdbzgFfKaha2k15RoxIDtEJkPvM0HKBsNeLJ1l8
	 CXIxHeieLH0bXBAneIekFJAPujcUUz5Qr0hmVt2f1yuEtIutexlO+1eTa7affFiGaS1lo
	 tshBzLGuIbRBfuUe/MZZmyACMw6xA+cDPI/hBTg0gMFwoCYXieZbKBf33UNdx2yb8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xbPlJS6qwfZzqUa056hpUcKGkd9cFIzccwWJm9phGjg=;
	b=4Zg0HNFmywck/l5LC9AWDbTTTfC3hpPbGpxMdeYaMWtlJCRa5NqfFPzVmRLtmJ1XdDky
	 ri7s9c+HPTYSKUfW6mOo/mS6GH3mltAMurv8mHEBiz2GoCM+keIyAg9WW12Z4QZAelCpz
	 wErakK81fCQY+y95M9kQBtoTcOCEyTIxbAvVqCioWcPxR6u7DnYXSNN7wehV6xw49h8D5
	 KrLOE+hcX8G9cLi8883wnbp6bB8qHClZPsEXZcXjKMBeT9C4R9HS6iBYVhmZUBfK7Z8CY
	 uxYY/SR9Fk2xTx8tc7fdakrquSrER5E1rqpsKMOneTJ2uPCrs7cmq44FqvL0WDyXZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lMREvsw4;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66514606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66514606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lMREvsw4
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so2595633c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264134; x=1795868934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbPlJS6qwfZzqUa056hpUcKGkd9cFIzccwWJm9phGjg=;
        b=lMREvsw4M7lZ1kgv7GSe+X02UOR03A0nw8vk5xpJ70qd+sSzBPAO7WLS8naehULzrp
         1lbPwzCUrkA8Z7YABjVOQB+IBmHYwYEx73k7HH7Vc0yq2LfOGblwkuMYPjeq5CBXnDBB
         wf8vhrmv7TSYOnKDYkQ5zA7oQoXvWB8zmOSU8NcBPn6lP9Y8uxdgI9AnnurZRI4qoB8Z
         ARb+dloSVJy2rlBGUOvwEerwofgpnpZdmViT+kHwvmh555zKf9fnkDgVD1TpwzVE0mlA
         GcuWTh3Vd8ojcIGNbNZ5lnoPhJx7aGq8EwXZ0DBUCH4XfzE5GujW+dnJscd/ZCCYqtoR
         w/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264134; x=1795868934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbPlJS6qwfZzqUa056hpUcKGkd9cFIzccwWJm9phGjg=;
        b=MZi67QkblOWv+4D5bmuR0E8tA7DpJQv98GRfutWZAgVxgnP7236Q1oSdTMM0eBzn6e
         IvLrp4+JDOlcR4HY7S+dVKSDEwuWN3omVahePOyj9QGKKPibcsMiNFFXNsOqCJsKrq4o
         UeFmfplcJWEi96mF4hVs6DwQOYDy/Gz7kmh8aoig9lReNMrGXEUWlZGhBngc/gs8WEhr
         yoGwN/ZQgzjQEG5ivQxPHAh1Fk4WhICitw9MMu82f4O7PjJC/PJRQezpIoisGVIOPrjV
         E930ehyr5FMFTiog2lCVmJQt2xO1uY728P8Y/AKlEzHI11PgwStWtPwAuqoHsgh7Jh/4
         OhwA==
X-Forwarded-Encrypted: i=1; AL+hErEos5sDAaa0X/tBX/JETmtCXmv3u894P9u1EA26tfWcKUqKp29JwVrgEaG01pOwYTKH3gtbNWK9RIXvhxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hQnx3w4D6XonY4CNVMlTLiUX4Hf1jGlOXkv96W5qzQ+0pjc13
	gk4xp1AginYC6MD7XzKRIbL6rIT2lUDV/+4QUTpwGysSq8nC4NU+jRU0
X-Gm-Gg: AZFdTZeqEVBYE9wUe8qodikV0xtv5V/4JRYzsw2Cs89SK9CH3/snWX07w8Y4Me25tIi
	U83C7bJjpb7s6Hk3vtPH1LeYKNa9nyhuDD4XSqSEHzGQPpp7zqXfNuqlrcmu12Dc4U8RSE2HqU7
	h8GBtZ6ni+nENwxT3Cwlyj62ZXslQGEXRfpUcMzx7eG7fK40JKaF+VOXqz5G1n/SrT4lnczchRy
	qikX7JYFeJdDD+u1stgSwmZVOnImAaw+6InHy+mNac66pk160IOt3K+/IAEA7mYktd1MaVDZGuW
	wlnj+kr7zNvbRWcJQpyIkWSLmhW1DkR+QBDKPreY5wwRAmM3JObqkbO+H9k6/RZglJ2SGbmaMfy
	ws7lOAbJhEa4FNiuCokjNOBH6xr06db6WlqSYBps4WxfTfPCz73qjYstODiU6osY0HM4D8fs6VB
	nsAJE9gvVlI7qIr/5hCbdi7KGXnJf/7xJrg9epufKkgOLadcNrZIx8saOvQ1gnU7lhFHuopszV5
	CWn4zagwyhxn4pA9xbgb+bb88uRycMwvEffNkrj+XXzVYvC0F9BpZLasI7bbGiZVVrJnvqLdF87
	KsX4tcAfa34+3WcTCd0tQKLFej/ZnlvwKb9CbJHfnfj7UCSZZg==
X-Received: by 2002:a05:701a:cc98:20b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b5568fbd8dmr5539812c88.27.1795264134374;
        Sat, 21 Nov 2026 04:28:54 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.235])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm9671917c88.5.2026.11.21.04.28.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 04:28:54 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael McAllister <me@michaelmcallister.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Bluetooth: hci_serdev: stop write_work before closing the port
Date: Sat, 21 Nov 2026 20:28:32 +0800
Message-ID: <20261121122833.7545-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAFEp6-37+O4BoSL414Njogr-34G7se-8Nu+O7B0zjBY1Jw7UWg@mail.gmail.com>
References: <20261120062048.40310-1-enderaoelyther@gmail.com> <CAFEp6-37+O4BoSL414Njogr-34G7se-8Nu+O7B0zjBY1Jw7UWg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 02:39:41PM +0100, Loic Poulain wrote:
> > +               cancel_work_sync(&hu->write_work);
> > +               clear_bit(HCI_UART_SENDING, &hu->tx_state);
> > +               clear_bit(HCI_UART_TX_WAKEUP, &hu->tx_state);
>
> Looks like you are mostly re-doing what has already been done in
> hci_uart_flush()...
> Wouldn't it be simpler to have a hci_uart_flush parameter to not
> reschedule tx on flush?

Good point. The only reason hci_uart_close() has to stop TX a second
time is that hci_uart_flush() unconditionally re-enables write_work at
the end.

Skipping just the final wakeup replay wouldn't be enough, though. Once
hci_uart_flush() re-enables write_work and clears HCI_UART_SENDING, a
serdev write_wakeup callback can still queue write_work before
serdev_device_close() runs.

Instead, we can split out a __hci_uart_flush(hdev, bool resume_tx)
helper (since hci_uart_flush() itself is the hdev->flush callback):

- Normal flushes pass resume_tx = true and behave as today.
- With HCI_QUIRK_NON_PERSISTENT_SETUP, hci_uart_close() passes
  resume_tx = false, leaving write_work disabled and HCI_UART_SENDING
  set across the close.
- After clearing HCI_UART_PROTO_READY under hu->proto_lock (to drain
  in-flight wakeups) and calling serdev_device_close(), hci_uart_close()
  clears HCI_UART_TX_WAKEUP, re-enables write_work, and clears
  HCI_UART_SENDING for the next open.

That drops the duplicate cancel_work_sync() and tx_skb cleanup while
keeping write_work completely disabled until the port is closed.

I'll send a v3 along these lines.

Thanks,
Zhao
