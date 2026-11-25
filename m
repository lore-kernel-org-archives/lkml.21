Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616608;
	b=sqUFgD+I22Zw3MfzUpYEZ69LExXsBKk3rKxpoDFUi6tSunseUIfk9ORZ+MBIS9XX0A0L
	 IIFeV1wUSTMD6XKOYC5CNveVYXZgJVjzXfaRCyD5rBWCw9gIxPjFY713I36kguzyAQqOh
	 JxUqotmbq6bpAIeLY79D1g/9O040+iFocAKkOKAfNO0A8PNjDrSf/oiA1qu1zwE2+MvVv
	 86l/O7Ye7C8sCvIIa3PSt4T55vXsEhT7YCyx2iIluzg2YXVEuTDgTFYD1R9PhLqXp7R2e
	 EO7GFy4aWAhbTTpy/tHOc4oU55358goQSYRdm5E/eiwF+sFPRh4+E2NqKqmowg9gtzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
	b=aPbkHjj63yT6SngS1fX6TdNGtJJToslj31/IT0wwX+dx7bx3Cwnd0Sy8OZFkamv3kFHR
	 POZ4wS4EdnqxHbsn8jGBp+bDEQC+Nb+vggDuiSEWjs823F2zJyXL2BZ0hyAvYNStudh9y
	 kM6GC0dAkh6hdjxw8mSAGZgq9N88sbPWCEv0zUL1piA6bIZRaR9iJcCtbS6xM06r1h65l
	 4xRe2j732CAiXFfK+zHOv4NQa2Qae5OEfdBLM0HvU+EToHhjsRKIQ8xybNQ5QLJ4fvrWz
	 kl6zTzwx8zTvLkzyV6a9Fo3Jk6HG7r+rbVjcUpYFnpWuPmf/ROUTf1KCKBXEqynXTaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VBU80bct;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B72606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B72606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VBU80bct
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-921365696d9so41288836d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616607; cv=none;
        d=google.com; s=arc-20260327;
        b=Zo5qjaRWfL1ahxuf2KE6p2Ni2AUERg5KC/SmlZR420Dnr6Ve7HPeVSC02ZP3wLQemn
         U5c5AtUVew7PG+tkONTahALNT3wpd2E6SMfhYaOHnhRElge1idKerUEBeQDYJ/BmngOz
         bW2o34cTSVg8+3OkWtNtrV2v8kHUoaMSsgvG53m8Q37uXhTZrV0a4SKsUCWSVhSCt6Ls
         Qyyw6rjQ7Wkfc5+6Sw/6NRD8zS4SM9PwXZtHLxnGFgZsjnxC2TOqsQfofb8KD5gEJaW+
         R7fyWAoB1chte4acRa06QDxl7v+kM8OtrtO450zmzshaNT04cgLoEeNiE+8NdJxq0P6i
         egqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
        fh=k3D3oopcEuzNnvfDYTzQCSTUCl0vxZCGgYeKsJXFMAQ=;
        b=RuMQPB8dAYhv4CgLSbdXaj+2z20YwK4jXSP4R3mY5NVABl/roKTWX4bJQ7OKANxIng
         x9ih7+/FmrYhTzqwD1C3KJ5ld8XgYuIO01RMx928F045koUCTArLHXspGLG8VQyDBQOk
         UUggxbsrndA1ifwIOGAPpVEIWXl4/8lgXOlMnKpiiyqCXcr5hk5rLwjWnn72TC7Qfxsb
         HM3EAA71+xcaL+PEIcqoEvyMG6KdvGyTZcQ1f2epZxNll6KNIeqBo2jAHRFxgJa3EKGz
         FChUoWQlr4auNARGrkUZNvBwzgMO0R80Q5kk+0kn7oitCO+61+B53gj0BXtH+oeYtAIb
         8pUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795616607; x=1796221407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
        b=VBU80bctXVpMU3NOlcb1DlRe4QrHv2umoc7orUqstYTkfK2oNJPvqhDfEXc+OmlQLp
         tj82uCESe7NUS695UcOtdEsBTuLM69Sq7WELmpiKH1jjZx8z1m646NGhXQZZAK/zm07A
         DF1Jz3tj8gtbadlLyO3TmyT2sVvszop32rWYQ0IHt5QGB6QMsowPhYWjB3gGt3b39J07
         zm014mweRk2RbJ1MBQzI7TzC9FPXW/jKNQEBmt2yxinv3gDPYS3h1DRkaS8HC82qVFWc
         Gb5MTF8l+GxlT5OWm7aiSSNtf9WhEz+vupQiw2ncykdpRLj34UKumuxKxjuZFS8iApnA
         B12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616607; x=1796221407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
        b=NyE2iLwV7L4N5d6vWeAHnNIiVKR9F2+G9+e6Ycq7YZiAQjxlo3rjZrg/bRCwFtOTC3
         twjR+10SE6th7ys6LAk4G751pMIPUL9eTsnNId4rNZBRplbPu9+bn9amxgSF1Am9cJ3J
         BjL2lAS0QC2gMsvFjAswGZIgnzhLNc1badyfn07GBCwa7aqE6aH+n+VIKgN5WreQ68mD
         sp9qQY6vNfyLb9BqxrPyLX/qWeaEsqQ2iNa5wkw02Z4H9UKGPC5EEWdYIePWRhaatqXh
         lETJB8S2yE547P8XkiZqN2mZUrf3cRDr9PXAQtmkqQdeOkBZ/qGQi03rVp/5F7VAswKM
         a4Ng==
X-Forwarded-Encrypted: i=1; AL+hErHmSH8mh+Ji53sIwFMtzh/R2pswIi1W648c4sOcgv6PsdywbVLHLZH35BJKdAGwrQ9YLxa7T4XBWUpAqX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fPg5Sg7jhVaUgORucrxggWk0vtGADk+qWP47h+ku+7nZ2M84A
	A9LteuWqYpRDsNKqbZmC5b/vrRkJ0PhG+JlSpXk5CJV/Mq6U8qU2w2vFL0/OiRSoOgaB3ufcrKD
	wosHD/uf4Of1PIfFeOzWw2f1UGhDGP/pgFQe1zew6WA==
X-Gm-Gg: AZFdTZfez4gTdUakJYBikA0l9gjp2hFI2af7i5Hey7Kwjlrif8Nb44eOq/cllmda33I
	2b4HfK6EgPidLWzcyAm8UqSBg5zo4pH3LqN0EkVTh+1xXbfgzzklKznimjcTAVk3S81vL0qATtu
	nVoxohVB6VIh1WoCahUfgVdU2uq/Uu5w/QMx0JXV2N+CP2/eo6tz8AkndEn1Up5H2keOsxT76Hp
	+rSbZOxzutmkIjQMfHga4C459ZkpkGB2jKtcby1robceYhWbGckmket4wqG12pyOxATPO4PXrC5
	tkmxtyi1ZzHyZQKb1a+V3KBLq6zJ/8lv33Fnn4f8qVIZ0PbuE45wzxv8i3xpExYmkf642KpEVuX
	y1wCbCBlhrN/SG2fjy7FcrC3rUXJ8a/nBf/RmT1qU3kNYSmi8r1UlPs2JgMivF+Z24pNeYyE=
X-Received: by 2002:a05:6214:2125:b0:921:1955:6578 with SMTP id
 6a1803df08f44-92134984b15mr344701626d6.7.1795616607488; Wed, 25 Nov 2026
 06:23:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 14:23:16 +0000
X-Gm-Features: Aa3M54rkSOQ0cxLe0SdeL4aNs3UZrcE3Vu7kmO5mBRqygoNs-GqHDcpUGoDVWIo
Message-ID: <CAA6zWZLp998F363tRSwJ1VuS6djfnGqPDDWjXC3o=JvYkCuOAQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] HID: Make driver_data in hid_device_id a union
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Aleksa Savic <savicaleksa83@gmail.com>, linux-kernel@vger.kernel.org, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-hwmon@vger.kernel.org, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"

For the record I did attempt this in the past [1], this approach was
rejected and a series which changes driver_data to be always an
integer was created instead [2]. However, I personally much prefer the
anonymous union approach, given that it will already be the case in
other subsystems. The HID subsystem doesn't need to go its own way and
the alternative is slightly uglier in practice (as you end up looking
up from tables via an index).

[1] https://lore.kernel.org/linux-input/20260518-mod-devicetable-hid_device_id-v1-0-a08e3989c283@thegoodpenguin.co.uk/
[2] https://lore.kernel.org/linux-input/20260727-mod-devicetable-hid_device_id-v3-0-980896ca283e@thegoodpenguin.co.uk/

Reviewed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
