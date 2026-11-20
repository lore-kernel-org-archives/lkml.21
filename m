Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172959;
	b=zEu/dSkrBln+RkspLso0MrCSUQFmbIYrzydNrfc5lUQVesKMYvjJkvw37sF1CPb5g8mH
	 bR81/iIqTqtNu2pYstr1rRYMY2q28tXX99Kv5pxvjC/6bnJtT5qkk+oe6EMEY1ML9uvDj
	 hlUbZS2QiwWqDTTyo6ECfVKtr2o6SEqYFah39mCp7iLzI8piDlmG9Xiu5eXRxTEbQ8uK/
	 a2LZNyXTCk3uxTdoFtr40rklK6VJOGuCFnL5SCzfbwLw9lWUC8jpJu3LwiN8+DKv6Vhgn
	 Mf9WP+fLiCPpTsMA6+7K7s14EK59IJcHUNTcAFRVtddq+shachqU3fJvonSTQo2yQYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172959;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=tMp47NzqReywlgYM5u2EyNEpsZnozcgtiE9STnzc4H4=;
	b=KwJ3kihHiykaAJcIAPuQAnuGyUTQXT2qCOp/e+zfmDJepkVNhXYiwSyrl752v8QtCe9S
	 MbDcSDzBnaW3AizpBLFA2+GjaNG2khfafTMBd96ldvLJYwZ888TFx2zYhpRr1lVhx8FwM
	 985JfNAtW2GMdxVBexOc4riIpJCfsvvTHxuB1+nn9v0OA3NFVWRfA87VH5At1K3tsX99x
	 ncvY981yfJVW/6N9WfwULZK2Ai53JBeJN81l0limDZAHNCeEIPdiAfWzVoJAnzAaU+zSj
	 ODGQYKKVuFu2oZJYXQ6+u9QJvNHCYnJ3ZY76DSWOxx89mVNX1ErsrhTc8akH0EZ/63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7560A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB7560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so1163621b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172957; x=1795777757;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tMp47NzqReywlgYM5u2EyNEpsZnozcgtiE9STnzc4H4=;
        b=cKDn+e1jQavV6wajv+8XeRClAeUDcrxI1/JgESTHfzL+m+PKYup5VRotQgkjF9hh0K
         n8oQPrBiXtVteZKZDBayUuZvL3k6LcZZwPzCWGSgY0jb7tek6UE5KgfsAemUKXcalFsm
         5hAnYDxwFQZrb4yJIHa2yWqkeFNWwFnOMho2FZcUJDEoa1PrDjY0mBsciXpScNZHqODi
         7BhDVAY7S/gZCiTq5DCurv/l132K9b+BOiSiDDEw0RfzpOB7dgRZIdSM9SFjEUx5shw1
         hmlp3PM6JtymIohOEt859VUvXg9h7LZ3jtUBunJ05Q20YRP23P6xN7ibS4DYU5Joxoo4
         IdNw==
X-Forwarded-Encrypted: i=1; AL+hErGh/XywjxZF/E522O258nbmgtPl/1MWvIYi8CzZSYvbksvkpoD4mj+z7jnBgBYS7SicnVSn9Ah2I2xEsqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6BFUh2v2qjxm9exXMXoXEsesyqIBMcb5cyjy7xWNWpyvtso/6
	d9cCTfM4RMn4yNYa8YlGUeCkJ3ZQRoGP7PRlJVenc5UUO6WlTHqo/RDaZPCAljcXeK34bHBF8ly
	Tr/1w4RqXVvhKlTxfO5k38kes3f26ev9SIPLxH9sAuWRI21rKcMhoOxI/G90=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1393:b0:573:399d:d487 with SMTP id
 5614622812f47-57a0d0e2d03mr3179763b6e.65.1795172957190; Fri, 20 Nov 2026
 03:09:17 -0800 (PST)
Date: Fri, 20 Nov 2026 03:09:17 -0800
In-Reply-To: <4f254948-29d5-4011-8865-c60a699d9bac@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b002a5d.6ea51c61.12eec.0010.GAE@google.com>
Subject: Re: [PATCH] HID: sensor-hub: Avoid holding spinlock across child iteration
From: syzbot <syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com>
To: crofts@kernel.org
Cc: bentiss@kernel.org, crofts@kernel.org, jic23@kernel.org, jikos@kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
	viennaoffh@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

>
>
> On 20/11/2026 11:50, Joshua Crofts wrote:
>> On 20/11/2026 08:56, Zheng Shuhao wrote:
>>> syzbot reports a SOFTIRQ-safe -> SOFTIRQ-unsafe lock order warning during
>>> sensor hub removal.
>>> 
>>> sensor_hub_remove() currently holds sensor_data->lock while calling
>>> device_for_each_child(). The child iteration enters the device core and may
>>> acquire the klist lock. Since sensor_data->lock is also acquired with
>>> interrupts disabled by sensor_hub_raw_event(), lockdep reports a possible
>>> lock-order inversion.
>>> 
>>> The callback only needs sensor_data->lock while checking pending.status and
>>> completing pending.ready. Pass sensor_data to the callback and take the lock
>>> only around that short critical section instead of holding it across
>>> device_for_each_child().
>>> 
>>> This preserves synchronization of pending.status while avoiding the lock-order
>>> dependency between sensor_data->lock and the device core's klist lock.
>>> 
>>> The syzbot report is available at:
>>> https://syzkaller.appspot.com/bug?id=c7c429f6851638ece81338f90c5b29ac9c0dea1f
>>> 
>>> Testing:
>>> - Reproduced the target lockdep warning with the unmodified kernel in 3/3
>>>   two-CPU QEMU runs.
>>> - The warning was absent with this patch in 3/3 equivalent runs.
>>> - Ran the HID selftests against both baseline and patched kernels:
>>>   hid_bpf: 45 passed, 1 skipped, 0 failed
>>>   hidraw: 27 passed, 0 failed
>>>   hid-core, hid-apple, hid-gamepad, hid-ite, hid-keyboard, hid-mouse,
>>>   hid-multitouch, hid-sony, and hid-tablet all passed in both runs.
>>> - hid-usb_crash.sh and hid-wacom.sh produced TAP 1..0 / rc=2 in both
>>>   kernels because no executable test cases were collected in this minimal
>>>   QEMU environment.
>>> - No KASAN report, use-after-free, Oops, BUG, panic, or general protection
>>>   fault was observed.
>>> - checkpatch.pl --strict --no-signoff reports 0 errors and 0 warnings.
>>> 
>>> Reported-by: syzbot+c7c429f6851638ece81338f90c5b29ac9c0dea1f@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?id=c7c429f6851638ece81338f90c5b29ac9c0dea1f
>>> Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>
>>> Tested-by: Zheng Shuhao <viennaoffh@gmail.com>
>> You cannot add a Tested-by tag with your name.  This is reserved for when
>> someone independent of you tests your patch. Looking at the syzbot report
>> there is a reproducer, so syzbot should test it. You can make syzbot test
>> a patch by sending the following (note, this will trigger a test):
>
> Ah, did some digging and the syzbot email is incorrect, it should be:
>
> syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
>
> Cc'd the right syzbot and triggering the test.
>
> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> -- 
> Kind regards,
> Joshua Crofts
>
