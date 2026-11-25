Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795579052;
	b=NgO+883pKveCQtpsGjgCK7JWnzlBbNFK0PTgs1/DC+AEsEElNamq8xNxB8cGHH7uT8nu
	 QWuqgty4ZX5pTTr93ZeEMqQSiEUUlcRvZ2AuObOPi3XqrqpyPoze9p0x9cyOE9oLhS3Wt
	 BlXbLS+pdZv/U9VTHfVbEm4sTSEDyc0AdnKbSK++d9hWf2VO/2c1aBZfuTRHUa9X5g4wq
	 ASlu+KErGQCebE46nfkUVdVDsAWgZBhEjpemsY3u+IL9Rm/xuRTx1GCt6Tz3kSiCGW/12
	 qWLmKJ4gRnHRIn1tGIWWB9kNIjztwe1oVNHLDT6kJkNE5W+jijgaFVYZXuFZGbIfFvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=DPblbMDs81opf7vzrovbRrh89l7hyZkCEI6lXortNI8=;
	b=GDusd/ghIgqC/qXQjTnXiIU1SwKqq0PBl5+kAdQuIHxuV7X9USco+rIi0Cv0vaZvT8c/
	 QYxxN3xFqxwEhmt+xt5ntzDcsN41kbzfD3Zm1nZ9dSxkxrXJl+1UpdeF5jBcCYvm/99Ff
	 Fr0DuCXClo2tizlaVwNpCvnDYH7qtqrzn+RCs+OEWU8Q5t/58QM+sv6V65gwjdJ59LzZw
	 Dt/DIRcU1cTFw0AYhp6NZrZok400GS2z3aeGhtG4EtzS/eOVW+I4vFTcHxIiDIzdbLfyq
	 VvAiHv/aAKz6o/XVCUS1NXhF8WrowjGg81WYOw8e5OSG0GfWxZlIUao95UHFDsAbJSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUkplrjS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3166E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3166E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bUkplrjS
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso11328105a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:57:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795579050; cv=none;
        d=google.com; s=arc-20260327;
        b=s1gMzmJMhKmSN74gllfQ8uFMBzfowihiQjH6kJF+PXQNzjcXIb2sK9ih2xgwDrVDKp
         puF66Kgh4zPhcsV9RyDT1Eex18pi1W/4m1Ksb6GNNpppPx6sdamsNd2+OE/MScbgZsGN
         5V14frTJD3xdOurfQ32y3/AQW3rCH4AAtYLNa50yKWCT3pGWRxFjNaBokMrgn7qG/b09
         KKF9dGbWDquZANt8kqA7C9GfhqxrkSoaaYZwhPlgdwFQuDxI/KCDTwSk/3uC0Bk71Llf
         9HmleRRz7CRlEn+Ow4CCcKHdRgrHkzd1aSo0cX7IuRW9Wp75ALRcVxf40eVu/CSsjPbi
         Bf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DPblbMDs81opf7vzrovbRrh89l7hyZkCEI6lXortNI8=;
        fh=CzLkQ0DNDi7Fb1pfnk3FhqmjTOzDX55rIKoIbCizeoE=;
        b=V9u4p0OxVndkm18dy1/H5sjHoVW3xxzb5pHHHPaXyNBe/Gouv060WnRHBj8c8IXl0E
         u7dc7aMrbocarjTqI66P2OTlCYcVd/2D8qg4A1IWU61Ixl57pWm+YeuHBJ55ugtp/WBD
         jPpaYfT0xHcIE9XBSwlhc1bnN1WyX0Sl3eoep9r0faEiLf47IxFVhYulkhK9L1EsPHD7
         I4BqoRdsT0dKPKnhWbLpuSvN8Nr3emyATGqFMPfir1Em1E1Hhg3sIWXJn9qYB2k1Awpr
         Q+llzbhT3VBQECPdE4JUJCBHu5DoNqoG8SwFV7OMazAZzstRsnFBlv/ZMo63R3JKLlZO
         J04Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579050; x=1796183850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPblbMDs81opf7vzrovbRrh89l7hyZkCEI6lXortNI8=;
        b=bUkplrjSMzIBYd7XTxyFDpgdA0IiCc6SXFF7lHjQ8K/7u5HqX3Kf9k2AgHBWXTM3qd
         HPGK0CV2MVT1gS/Bs31n5KUlvm95v52XET4o28gXWymmR9Z3PL1kRjShoSTK6Yz4CIu8
         xH66hMfXQn0TcznNKunNKpQpxb1kKPNn+axUpwq+l8s8SEAz7omcriH63C0u6K0wKGdm
         QnU6dqT1Ef7EyzQwhWZHL5jop8kviGkRdxOxDLaLAv/ZL/9ZJveFQGOvzPqORymT2l0c
         4/axMDFbIS4Jmdq+qwjp+nZDJZOC3Ik3UUj5GfbUBzBKeUHPzMI0sYjRkvUWir9lXZk5
         0xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579050; x=1796183850;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DPblbMDs81opf7vzrovbRrh89l7hyZkCEI6lXortNI8=;
        b=zIbbQzWrXb6zxdSF3AXHb+QUb0xFmCnHGQ5CunuorGUbNjECzdsA21BA9iSEt449i2
         kzUTBRk/KIiz5iIXsQ9luD/ixex1rzs65wHgxraf/wRCCi1uHMI9gXUx1AMsV09Wj1am
         bXb3YZFWAsJp9h3T/lhXOSMuhF/wop6tlIMkMOeYljeETXVZ7hHOwWiivk9Zei6Rd087
         Ec3qNcGm/5ByddZL1ovFMsjQ9PLYQy4xmrTTNfnAyWssOq/nmGgqYaVjU7dqhdyhj4FG
         7wjEH9V91mbRlprNMFDEn+HtVvOwT/P4YXa2M5N+NLFQt+8BfVKHdtW6fWQugdOY4D0B
         NcVQ==
X-Forwarded-Encrypted: i=1; AL+hErFqP0u/tl6h88PFIdNHvVqODEEXi5T+kUyLd4LQpQjwMgahxf1hrxK0a6Q9IH9ZHslyPdwb7QSFMxx2Gt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sEZ/SFbk+f0KfdHG45ghqbjLwguE8X/8J7xA4JPoESEQbmf1t
	+cQQllgZib4glrVcgRxIzGu1aKdFS2VpTKrELOWCgRTCVfkR3cKO6V/+C7iT2jLlgJPA7yQRXmA
	U3dxty8VT3+iLCAoVVqxrdKnpjPdWqbI=
X-Gm-Gg: AZFdTZfjPyjNubL0d9AQ2R+KcjDl8QrJrpBLYvJQjOGxiuyeC7LCa6dtlZMPFeIDsqU
	O7Q8PiBx3F1/eDIFKfY3h0uFdn1Zke4kss6PFiNtxkVnrSAiJIxc57ktmKO2EQjn8aiW9R+I3B9
	ofrXSu99upK1DvmersugU37KhiICHbJXU+B71+AMgu81oGSAOa+BfeWeLnsooMeTyyMyzu+4SMv
	+XqsUbdBwNUrbRPruApCBTA2oMqXkDjckT1M6a1Tpe9iA/Nw1C10UcKipTUWq15s0FcYh6xTUkV
	TB7ut2GNoWiXjufkoY4OBpj1/NquY5mMZQ7TBiTPfF+Hhql/tSCFoIozgCaClipfqFy5NvlKlNk
	NKS5+n1w/WD6KOSuhrOV8u9zGxs+FJhk3xvTPP3c=
X-Received: by 2002:a17:907:c0a:b0:c51:5589:31dd with SMTP id
 a640c23a62f3a-c5155898474mr1045991366b.22.1795579050508; Tue, 24 Nov 2026
 19:57:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?6rmA7KeA7ZuI?= <wlgns2756@gmail.com>
Date: Wed, 25 Nov 2026 12:57:18 +0900
X-Gm-Features: Aa3M54ozX8hHOk2A1p9z_lNWiP8LO6JHW6TcWsR7WyvcD0yx9ODOBN0eoJU5vU8
Message-ID: <CA+_3iFgEe1EQxY4FMA0phAQZMnt-nRY3Z-TCfWcX4CtFH9NqVg@mail.gmail.com>
Subject: [PATCH] comedi: adv_pci1710: prevent NULL deref in command test
To: abbotti@mev.co.uk
Cc: hsweeten@visionengravers.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The COMEDI_CMDTEST ioctl permits a NULL channel list: do_cmdtest_ioctl()
only loads and validates the channel list when the user-supplied pointer
is non-NULL, otherwise it calls the subdevice's ->do_cmdtest() handler
with cmd->chanlist == NULL (and cmd->chanlist_len still bounded only by
len_chanlist).

pci1710_ai_cmdtest() calls pci1710_ai_check_chanlist() unconditionally in
step 5, and that helper dereferences cmd->chanlist[0] on its first lines
(CR_CHAN()/CR_AREF()). A user issuing COMEDI_CMDTEST with a NULL chanlist
pointer therefore triggers a NULL pointer dereference.

Every other comedi driver guards the step 5 check with
"if (cmd->chanlist && cmd->chanlist_len > 0)"; adv_pci1710 was missed.
Add the same guard.

Signed-off-by: Jeehoon Kim <wlgns2756@gmail.com>
---
 drivers/comedi/drivers/adv_pci1710.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/comedi/drivers/adv_pci1710.c
b/drivers/comedi/drivers/adv_pci1710.c
index fc749241d..aa0e56df4 100644
--- a/drivers/comedi/drivers/adv_pci1710.c
+++ b/drivers/comedi/drivers/adv_pci1710.c
@@ -621,9 +621,9 @@ static int pci1710_ai_cmdtest(struct comedi_device *dev,
  if (err)
  return 4;

- /* Step 5: check channel list */
-
- err |= pci1710_ai_check_chanlist(dev, s, cmd);
+ /* Step 5: check channel list if it exists */
+ if (cmd->chanlist && cmd->chanlist_len > 0)
+ err |= pci1710_ai_check_chanlist(dev, s, cmd);

  if (err)
  return 5;
-- 
2.43.0
