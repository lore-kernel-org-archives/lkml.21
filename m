Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171854;
	b=TFPQPN6hq3aIC03JGFKeNul2qCqKh9GMICiV0Jq3P0lqu1Nvgav1SJXFPRFwbZNtIiWX
	 JzWvTBeOmZvvz8YYsyN4AgCc3v0o4w+iRME0BrN3jgG2G0dkZUjATRG6w+OVqBdyIj8dY
	 vSINfqFMmCIJ9KtJ0kUwHin7dR+6l3WNjTGcBM1MSIW3dCsCfngYyaMlxY/HEAjaMBPql
	 settgWm6U3gTT2c6O1e/IyWvjVsrKz1xbxrrh9ZuNI45ojV/Scd5NGhyTx3v7WGTqLRx7
	 Yaj056k0EZf1aCvvymsBjhfXBSzX5uDdLr7PR0fd1hHyxdVA6Uxt1JfwQkKqI/mZq/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171854;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=RuCBGxW4k+nLAhcDYdOOEYmXXtboFDr5QBxJOONXv6U=;
	b=ulC8o4eSdOyanrnOP8cWK5Lbj+3DGyNZwbg/pPoub2D2ErrVt3kpjXa+KRzktBCknlQv
	 WFQrtpg5Z9K1yZnf8MHzTY9P77EqtaV7xEcdUnMmbCrv+hMM1AlxmqwpUBY3vmouHKnoj
	 UbT6A5AiB0f+CGkJqsl5N+A+cZROz5Ktm3Hd7qrfBHlQHXAaQePANZR4YhhQGBWlBtl/+
	 Oq6pBdaZZPrM/Eh8qiRUlDq/GoaZUHSHaFq27RrxqeF+WoWPk3DEaYyPTvx6vUtExv/SV
	 K7dLWjhK5Z8I4TBSYLPkEtuxqYcOkQ8mh+2hTGscQfG3TDQZXUZdAENjGMvGPW5mGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2AB60A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2AB60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dab94dc3e7so1988499b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171852; x=1795776652;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RuCBGxW4k+nLAhcDYdOOEYmXXtboFDr5QBxJOONXv6U=;
        b=myjCJCrquzVb2gUDw4qze7yFFW+JWFQ1Igg8wXUSMoENZaczDq9fs3wNErU32whYy/
         D6A83Gu3KIDFNtDvjgXAl7xwbr5ygL43qJ5yALEGWEEEDyTtcDMiUbJyVKkNu4XETE/J
         PbGYB0v2QeR1vTFDzYLzY7vNnrVhKoTT8GNfXZNXz9KO+NGKM/PzjKqnbOXttPUKPGaM
         DCAY2OeWco4ybYCexUGRq7sLvQQ5BJH7KJ9ZHGu6uh1NxQ3KC2Cc6wcSL0nWZZGAZwvk
         SAQMCACflIeUlK47VyTg424p03mk1HcAodDBAqOdNJbyPYOCXXlTxrLKbXX61+s/JZNI
         C+BA==
X-Forwarded-Encrypted: i=1; AL+hErFANObPM1KfQIKLWEDluVR9vW4f+mp/jah8HM8GjGMjq0CjVp5Rw6rnMl9zZaHKxKDpuDXwDa879M14SZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I+Uwofkhr+Krqnh8dQgBZCwRY8auBVhXp2DYv2Xk/yCCBtkeK
	sFy61rRZuczKKahfueqScGqV5+OS356K8PrSl1u33irAfAS0giYbN2hxJqfL1IopnT8qff05I6+
	tm6vU1WpEcfPOq8tZrUiFOpwlNTXFdPP6vuSI1VqbkQW/vEhxEM7H2sdSVDY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1783:b0:571:76cb:b4c5 with SMTP id
 5614622812f47-57a06b25c93mr3051987b6e.2.1795171852750; Fri, 20 Nov 2026
 02:50:52 -0800 (PST)
Date: Fri, 20 Nov 2026 02:50:52 -0800
In-Reply-To: <0428126d-684f-4b4c-a805-7dc3e2d56897@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b00260c.c48d0c14.ca62.000b.GAE@google.com>
Subject: Re: [PATCH] HID: sensor-hub: Avoid holding spinlock across child iteration
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: crofts@kernel.org
Cc: bentiss@kernel.org, crofts@kernel.org, jic23@kernel.org, jikos@kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
	viennaoffh@gmail.com
Content-Type: text/plain; charset="UTF-8"

> On 20/11/2026 08:56, Zheng Shuhao wrote:
>> syzbot reports a SOFTIRQ-safe -> SOFTIRQ-unsafe lock order warning during
>> sensor hub removal.
>> 
>> sensor_hub_remove() currently holds sensor_data->lock while calling
>> device_for_each_child(). The child iteration enters the device core and may
>> acquire the klist lock. Since sensor_data->lock is also acquired with
>> interrupts disabled by sensor_hub_raw_event(), lockdep reports a possible
>> lock-order inversion.
>> 
>> The callback only needs sensor_data->lock while checking pending.status and
>> completing pending.ready. Pass sensor_data to the callback and take the lock
>> only around that short critical section instead of holding it across
>> device_for_each_child().
>> 
>> This preserves synchronization of pending.status while avoiding the lock-order
>> dependency between sensor_data->lock and the device core's klist lock.
>> 
>> The syzbot report is available at:
>> https://syzkaller.appspot.com/bug?id=c7c429f6851638ece81338f90c5b29ac9c0dea1f
>> 
>> Testing:
>> - Reproduced the target lockdep warning with the unmodified kernel in 3/3
>>   two-CPU QEMU runs.
>> - The warning was absent with this patch in 3/3 equivalent runs.
>> - Ran the HID selftests against both baseline and patched kernels:
>>   hid_bpf: 45 passed, 1 skipped, 0 failed
>>   hidraw: 27 passed, 0 failed
>>   hid-core, hid-apple, hid-gamepad, hid-ite, hid-keyboard, hid-mouse,
>>   hid-multitouch, hid-sony, and hid-tablet all passed in both runs.
>> - hid-usb_crash.sh and hid-wacom.sh produced TAP 1..0 / rc=2 in both
>>   kernels because no executable test cases were collected in this minimal
>>   QEMU environment.
>> - No KASAN report, use-after-free, Oops, BUG, panic, or general protection
>>   fault was observed.
>> - checkpatch.pl --strict --no-signoff reports 0 errors and 0 warnings.
>> 
>> Reported-by: syzbot+c7c429f6851638ece81338f90c5b29ac9c0dea1f@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?id=c7c429f6851638ece81338f90c5b29ac9c0dea1f
>> Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>
>> Tested-by: Zheng Shuhao <viennaoffh@gmail.com>
> You cannot add a Tested-by tag with your name.  This is reserved for when
> someone independent of you tests your patch. Looking at the syzbot report
> there is a reproducer, so syzbot should test it. You can make syzbot test
> a patch by sending the following (note, this will trigger a test):
>
> #syz test

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.

>
> -- 
> Kind regards,
> Joshua Crofts
>
