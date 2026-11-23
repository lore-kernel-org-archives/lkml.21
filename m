Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413484;
	b=WBUS+v6hs0Kfs+EuYifaSEmTr5XsgGA4+R8muLhZjGTNb6Hk8p7j1oww3sz06wkjnVTP
	 PWkAKhW1bBhUnKPKuH9sOMWDaIbYr0GjfeTPP8Qu6vUNw5IJWrtsa36RHYk/2Ley3URVy
	 iLToPog75MfzfK3fVXgc73CoeaUggTiBavQVzoN7vLm+iqaPP2AELUBk1Xmt3Zj//DJyr
	 thta3vGwoQlZJVCibhQn/tDQQc4J49VohwJYOeSz1pciUnY4UUqYbDLVdHq3MNFsDszkp
	 A8yZoy0GLB8wobU/shCbaKtgbHR6n1sdE1aETVQCkQghQpRc2ZTtmyDzbT/DpE2ibYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sQWFC0f/1QUqQOyIEaOvFD2iCSmZJvZkkc8zqipcZqI=;
	b=P0bYhKu3jJ3wdh1j4YBLoK5AvBEWJeNkYBYKYuMfh/L7LoTCs2Z0cAhJbJcsREa5DCEI
	 aw0Uem4Ljv57/DVhPSAEnahz8gEfAAvQFIB7aG0rLIwys01bzqH93aaOJNi3MNXm9zzLc
	 pk9f5BXzgDdIIHN3Xf6KX8ky2QYWRH0uTD23+6lvEMhm1S8pKv9gZSC4EMFzX+225nThb
	 +CnUwzlZPM+EjJcF3qLz/LLygru822hGlLKFvROUdXKfpg2NzN+cNm0p/uKwXhZgVeNvO
	 Y8QlO5wMfEIjIhUWc1RVFtjqQwxTP1X/1ZQeUB3BG2nUIdQv8OAXF7xz56Op9AjfuRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHkvfDT4;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA0606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8FA0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHkvfDT4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38699cf08dfso2528957eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413482; x=1796018282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQWFC0f/1QUqQOyIEaOvFD2iCSmZJvZkkc8zqipcZqI=;
        b=VHkvfDT4ZdDkVgEY5yPw1fzWVMiIToihl58fOKC0/u6RHqbbBneDNjOyLIuCq+VXXb
         FgbPArrbmCP+tvvSfNlbgaeTtNhh1OOcQ1hwHbD7sWAkmoJKe/Rx6sQ97+sHZWqm5dwa
         ZwPh93nJp/zmgCypr9/ltLq+JmsDXmT8C9YF3o3nbNB1deFUfsIndbUN45aviERka1mc
         K0BMlttarmtX+9lwTnJsuiBrohnRWp5qI/GxerP+2kg3SYSpfp3kMTZUmKRV8H+lgEqi
         GooVAr2wPlHab+41Taf+XpDJhc2EdnS8vArCSlVtobVcoYQqPke4y8hG8RpctK/K3qqP
         HA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413482; x=1796018282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQWFC0f/1QUqQOyIEaOvFD2iCSmZJvZkkc8zqipcZqI=;
        b=Vckrw88GEhvMjUlb5piTr2JDanfh5ps72CKU1aIlf4cV6/dcNMksqVGF4gxQWB02T5
         6AJc/AHSqRkx9JbeQTcCRcrrE75tCJlYopN03/n/CWcm9e/Ajgth+LIYsTfGbU7+u8fj
         Z4c1ZSjumzrIhT1YSHogU1jHxcOfR/q6e536/uIRPF8+Ac/xa7QECXg3jNIJIoGquAfd
         +L7bksssvLVzZx3WALOmQj6zMOmtwt+TddACQ4N35gwzsI0+7V+CoNI1EBqpI4RxFBAf
         YC3W0w//9yNnaK3+6L+kZWMrSHC7qnhCKQjV1c8x1dQji0x2/6MDtbCQ09YECzmfQy77
         cZlg==
X-Forwarded-Encrypted: i=1; AL+hErHK3tiYHIjKVdKf6rKT8NPciSslM6+PbVZ+DBhkhgoux0bz4ttDbx0tRCMn6lkJzncIwLG662ja0eW9XwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z89aXRCco6ZfxlotYpJnWnh8BhCZgtBbOyi8D1K2EIegrM/5Kg0
	NW7+HfEaF+UtOMV9ljtLr3IOHIRIvcNfV+0OCm7vVn5wLAgyTYTYZDSxJEXx
X-Gm-Gg: AZFdTZeqls0nay3WpCoyXJcW5Jx1tBmys8Lsh5WUMaE4CKqwZsjob5zVF+i7VF2DZzN
	jq/+LwAlckJbTuIJ5qreWwy//Wwv6TGbpxmGFRUCE6TBbuKs3+4LHOHWfyzTh7IbeDrezHXJxof
	q0hkwFhgQw88+j+K7bY57LrnN0GTEsFbbquB0JlUeu9wLrLC1Q+g8FruVaG6nvpM5NYndtOOD3q
	7HelpVLJ0B2Uj9aLyK1N+RS9tMM05x2fTRxtIHboiPINpnZwk0jcXcsafGo/Blse2zS2IeK/XtQ
	hBdQRZuZIwrJTyRJallhXpcD85MF9rrCMqdhcLOHMbdsLuOMp2lSGPsJ/zCHEBsi/DhtKHfaBi8
	FX1+Biq9Ap0FFUiioQSjtPAdD0WDQTQneSYBye+yXWFTIvNuS+xhbHSb7pspGT4ckXrTKg18vuI
	x91mLl/wzmvSc7XbthJH2v4vJUzIr37m57wPRZQQlm/U1XDL8yNypJULwnldtKtdFnaGQPx4mvS
	JjQXOgvYycANQ6gsGMCQHMN+BW0LMJSs/cPhrVwfvqu++Q41p6ZpKyAbmokbH/wgP3conWgOoF/
	Ige95VyG15dMdp4GbQ0+VJNgGnWAvbDECdM2vXU26NeRQaqAcJiGcpmsJ8NjS5xQDwq2bLWm1I/
	c+X9rI/Eb
X-Received: by 2002:a05:7300:c7ca:b0:386:964d:45d2 with SMTP id 5a478bee46e88-386964d5ddcmr8948434eec.11.1795413482428;
        Sun, 22 Nov 2026 21:58:02 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm29938655eec.16.2026.11.22.21.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:58:01 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 00:57:57 -0500
Message-ID: <20261123055757.11283-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112338-pummel-hyperlink-2957@gregkh>
References: <2026112338-pummel-hyperlink-2957@gregkh>
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

> Local static variables are usually not a good idea.  Why is this needed
> as it's only referenced once?

is_apple_location signifies that SSD methods are available in the ACPI bus,
if we dont check this there might be a situation like:

Is internal USB Controller = true
x86_apple_machine = true
is_apple_machine (Are there any SSD methods in the hub) = false

So all USB2.0 ports will get a error, and all USB3.0 ports will succeed and
provide wrong info.

And btw the SSD methods are only used in new intel macs (2016+), so this becomes necessary.

Thanks,

Atharva.
