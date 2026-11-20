Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167807;
	b=liU1MTuCszUS7memzyEL6dn/tXm3RPvvzRNq8qGCRlfXSHCCEal978RugJqkDYdwSqaX
	 scWmrhthjeNdpkgvUcXx2iRF0CkUEf5yeE0o4GIJ8S4/KruRt1leQwklL2qFvJvl3vocp
	 tAyJ2YuuUrHyLF9YC5jsXoXxNBv1FORYv0gum6QfQ7g/MdXs0topU3ScvK/yJf1juTz5T
	 qtq5T6tyVadQlmfh/njpe9OQA7kiCq8Nb992/w6UGUlOYkPz26Gb2dF/8yfTrfVPO3WHY
	 dfnQLAUQMWxESlcP1fzC5HZdIHgUDKNKPcBrHqfS0acpC3Qz7DptILp5YTzzkBkm1Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=EX+PW/7sbKTj4iiMEBEnlFbpgWQFljqyfDjuaTarVMg=;
	b=pIRa+RIyBFsFeO/XmApW7Q0WqexaVPU6SBOQnFeP3Fieny/QZSuqskKVZ5BeWjnHXqsj
	 AHBPmUa/jxEXDxjU5mftbVNevJ14Gj9KLNyuaTcVfynMjeAoTUDhY4EbqJ4RZHPF4X+HM
	 GczfRkM4XCyI4aC7JgQb06YdSJp3Y9uI/F+Zy7IFTji9y3aBT5p29CqTlwOacoyAGvJRV
	 J9Wm+WDF7cH46foCcxFSxSQPo4llw5sgEFFdsvmr718DiNOYGVhr9yxV/LCjWCgOTjTBE
	 pr8NZOgNZjr6ImSKAgBe1FNSVaSIJB9guERCQB7xybqQe7TwSoLN9qQIEahpgow7a7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfutiSpq;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B6E62606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E62606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfutiSpq
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1070308b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167806; x=1795772606; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EX+PW/7sbKTj4iiMEBEnlFbpgWQFljqyfDjuaTarVMg=;
        b=tfutiSpqfKENDIZRqrdOIiAMOgjM/ngUeVxfahA5i27iAD5NHIIUU9l8FvZ1KjteDf
         eawKKtN76lqgLIKpwgOrGAbx0ZMRC95RDahIqYbq9yj46EPs9p9Eduh/qmY++CYme+Br
         pcXV2p7RNPDbRqFDZVocropyy5BCLbsy23cCPwJvycfD2BMEjXw0qbmfzlwQAWkHSAOT
         LGA5ZBe4naUUXb51n02W8xl5J7m3CCzQZ3g8kCX2L5j8EGsxOXK4/qPiYWwJadEvpyrP
         aCDI9dglhsGUFpkuOT1oYNXLemOWBIKTk/bI2NUUMnEEtZv3JVaK7x970D9nw7eqUG9u
         oXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167806; x=1795772606;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EX+PW/7sbKTj4iiMEBEnlFbpgWQFljqyfDjuaTarVMg=;
        b=HXG2va52ImhFuhBWaBOUN5RtD8Q/es/nbMh+YKBbeEbYBxKgAPjPTO1NRVaTj8PhIC
         Je6v1KwHo46lPD1V47P8j7uE9FCXABZvNIYhhmuLfTPBSwQ/7rzwjQUonyWvqc8upqO/
         ZMrPurMzSs4fPBj/N4BV3fyejvG/5ElswVB7IBcuclyHOM76RGiNBdjW28Puo0RbUszz
         tA8vdJ7nE/y2cy+UPScjg6FJu7siVOYVB0M0zb/cC9Ij3rDoIfCEWYJLw+08uQ1+9r+p
         P3Z+31wYebZpZl2D98hsvjANlTKl6+NIIZrw9lXYJwBmriaqefkDN1ZX18Fgcp+1sr3x
         4U3Q==
X-Forwarded-Encrypted: i=1; AL+hErF6eewE7IRi47vFS8vItWH5gNpT5B0EiGGOFcSrprw7dnAw/TYg5tcXvqOFyzoAwyH0Te1DW1U2Q32ndBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d4S2HLvXojYBxmjhBM0gPNkepcZvE5O0RHcfIfX11HmUvwEma
	BLFl4HMDiiqyRqzF7oKfDVdbHVFMyjd9mLdFzamFhe4e7Z9QCW4zI3Xj
X-Gm-Gg: AYBFou3Le1753zCb9qVOAJXDKwJRjsSzCF8kqx4dsTlWk1P0z3BKZDSNQG74ait3xeg
	s6rl/M2PRiCZpPcsr7yUXhq4nvOmTOJYj0iqEGwAuy764HHNoZr9nC5PKlCBlUzJ09VLavTGc5N
	qCu5NyvaJFQxTFBwVz/A5uuX5Tx1CrYMFHoHtuSPAxccrwowWUQrlGs5+KRlbn+l04Z+p+l+eNU
	vUu/o035F5DBe5sFpf2WRcfCV1IglZdAOLrl4GjRHGLZkuxmuQqg9BtFwqAUYG8+XvEWvb1AUPn
	5PTLwDKFSD9exxS16BzPAy3yRNnxbbUnqXk+duzwYeZ1i5qAecpyCxORfrS9q05CfaSMIg/62dl
	6RRnSc2OHWM+9lrzMaIQAWLEPkmmeBpVNGiT6uITs7IABhQPM4By3QmyeQooRrFQPV8QLPW/3Ip
	+0qKEE2osJRaojCGQeeqcYBEDDzG2z6O0I6FbAXNBtx4PGyaq54og+W7ogqB3iQHBzDOG1uWE+U
	5sAjjrFXArkpPJNMSgT8KOYDL881TBex0mB/L26U8Enlco4RY5nu+1wMAifVw83mgIl+n5JfF1r
	Iuwtixo/vUc3RU2IDGguZ4crQkxeLcFi7258cfda09Tet0frdRfWjinaPLX2UnhIs3KdrEBKpLq
	v+3y+GfCZYYGYP0tZl6KIuHb8gQ==
X-Received: by 2002:a05:6a21:8210:b0:3fa:5301:d6d with SMTP id adf61e73a8af0-400aec05810mr3382866637.44.1795167805658;
        Fri, 20 Nov 2026 01:43:25 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6d03adafsm1103571a12.23.2026.11.20.01.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:43:25 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: disable the work before
 masking the interrupt
Date: Fri, 20 Nov 2026 17:43:19 +0800
Message-ID: <179516779969.759914.14349189301325900521@gmail.com>
In-Reply-To: <20261120073021.GA3126029@ragnatech.se>
References: <20261118072321.1259639-1-shunsheng1218@gmail.com>
 <20261119022903.1493494-1-shunsheng1218@gmail.com>
 <20261119062203.GC2300348@ragnatech.se>
 <179508711555.3615492.10674834361832600268@gmail.com>
 <20261119162517.GD2300348@ragnatech.se>
 <20261120073021.GA3126029@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

Thanks for offering to test this on Koelsch.

I went through the Gen2 thermal driver again.  One detail worth clarifying is
that rcar_thermal_update_temp() programs INTCTRL from the current ctemp and
ctemp - 1, not from the critical trip in the device tree.

Gen2 reports the temperature in 5 C code steps.  That does not mean the
physical temperature has to move a full 5 C to trigger an interrupt: it
depends on how close the sensor sits to a comparator boundary when the window
is programmed.

The handler masks the sensor source and schedules the work 300 ms later; the
work updates the comparator and re-enables the interrupt.  So this path
normally limits how often successive sensor events are handled.  Reading the
zone also goes through the same function and reprograms the comparator, so I
would avoid tight temperature polling while trying to observe interrupts.

For the first step I would check the e61f0000 entry in /proc/interrupts.  The
line is shared and the handler reports it as handled either way, so the
counter alone does not prove a thermal event.  The driver has a dev_dbg() in
rcar_thermal_had_changed() that prints rising/falling, so

    echo 'file rcar_thermal.c +p' > /proc/dynamic_debug/control

should show whether it really saw an unmasked status change.  That needs a
kernel with dynamic debug enabled; if the file is not there but debugfs is
mounted, the same control file is at
/sys/kernel/debug/dynamic_debug/control.

If real sensor interrupts show up during a controlled temperature change,
then a small number of bind/unbind cycles comparing the original and the
patched kernel would be the next step.  I would not keep a sustained CPU load
running while the driver is unbound: with it unbound there is no thermal
monitoring from this driver, and the trip is only a shutdown.

There is also a condition that may be easier to observe than the UAF: in the
original code a work that is already running re-enables the source after
->remove() has masked it, because cancel_delayed_work_sync() waits for it.
A test-only trace of the mask and enable in _rcar_thermal_irq_ctrl() would
show that ordering:

    original:  remove: mask / work: enable / remove: done
    patched:   work: done / remove: mask / remove: done

If the natural race turns out to be too rare, I can prepare a separate
debug-only instrumentation patch to make the interleaving easier to see.

Thanks again for offering the hardware,
Yaohan
