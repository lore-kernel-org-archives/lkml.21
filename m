Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795283878;
	b=TltmBoays2SzRyQhFku+/COE5Su0LyKaIBFEwfHWBvNCT99c9dXvU/qppURDhZskE7iZ
	 DSfUaA6UoLF5wwyL3cUPDw4hYFqJVvkVeGuwcBXwvz4q2JPAkHmf2tZJH3lOCv1NXI7Nr
	 2nYWRvst6QBc6EEFLaJH7DA6oN56K+FAx3k3wuM3B7h0dA1bEzCBHKXYr0lpLRNV00JnV
	 /VLvGNcLS7tOQqPFUFpTjg2g8KjoH9yFwdaD9U2n6MRkjSjNXVRc2fPXfz8QVkTCIaEMo
	 ddkfI9nekACPHdjyEkqwG+u3S7oHeUI/eij7/wnh3ZE9/HreQjC3BPNWz/RYOPHLryQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
	b=gYwCnCk4p2qUdFriwpV0p/5lCjdrQAa4cB3OUzNtX2m2ifwBs71+J7+YS0QGKOIiQlqE
	 OLjyTNkfXpmshZHLyLRNbXQxYMUCZeYC1U59WKDWrksVvI7+MuXoD8t18alhlArz3nhhF
	 fWDi8Kz/S4O4TIyTt8xpd8ZzejGzMyV7qYV+EbF2L26271tHm1Dh+ovV7Vl/zZkrJOAyo
	 NT/3DUyHeoAXkGayVDaoSDaNWfrFK/FaXP2q+QbKHpjAQCSuwU72KWnAKk/h5dDoL7Pm3
	 sNmkA9oq+RIo30SBIqC3Rh23NhM3FgiPZMTqMFJk8a1z62JLvvWEEg63hZpJO7FHYsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKyGJ9vz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4298A606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4298A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKyGJ9vz
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4f4095a7aso16346657b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795283877; cv=none;
        d=google.com; s=arc-20260327;
        b=mVJX8UjsRcXrIa5uTinTRSVEHIYU5sFMoIzsN2Jh0iW2SdzAuUUq4BelQ47oaKZ+ZO
         6F6qGUE8ysHQPpcEQvbx+Zu6rkNe1ajDE92vTLg1TUW+8+gomBUNjX4/PkgTpx9LF5JR
         ThTYmBbJVbfJBaDzLxOdh6MYEsxsFSAEQTUXLxV3gPy9cX4znebBqgE3+mJwuDLKZ1N1
         SPLz4yZVR6APgbWbM5O+c9qBudKnAwvymjPK8+ugHSS7Ypzj1Go2N8nZ/X4BerRxECgt
         P6Bj3zjbM7p/ccUdnY5UH3kXx+O7xLz/DlaSwE4IUIgTfwF7sIp5GEhboZK1WYjUVhKy
         DwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        fh=I41EvoD8ZUT1x1gdR+/iS3R84F6ibF250pg2vq2wEqc=;
        b=TgdToVNM9oRWoVJFyCikz1NQXLboXc6fZSjMZ42/oyo/NVZ9SeYF1yfxiQeAlB0/2J
         iFoIuCRcyFhybu2Lc/zJvJr3o+u9Qpwcfsr/XRTj/q7xZ2iFOusoIyYH8RxOIJkkeX8U
         BtoWRTnBTF7hKxno4g3DxPbgWYiJydKlawvnqXE6yNfZh2kNvAMKbFfiuElOj29wqfRJ
         rEzn806NeaO2LP0ARRKuX/SOWPM0nhhiXQnShAPD6oaLMHH/bqKcHOkBEf8vjKLHYI3/
         enQtCrp0IB8wfpcH66VJ7zv+VHc52q+YjkQ9CWxLD4Jb716s9Z/IT577WJg9MvKNGxv3
         Cdzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795283877; x=1795888677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        b=cKyGJ9vz/Y3l2UyC/yQyQ/n9y0dy3l4G6QyRPNozuRWRkWdDOPoco7P20MnCRDwIOI
         0Qx6fwAB9Di99HKHKEq7KQVP78GtThbRpaC1kE+8RvOLXL6Xd0x/RC01r6ckEai32INd
         75MzUDIT6EyzHbq+I2if8Jcfzkl+cz0lA9RDA+WQf8jhIA29nAlplubPIfeTkmUNL7A3
         rSGc/SJObT/IwPDS1d0P99irlqrATQaMWR6Q96QPYJfjVArUh+KC3kjJJB9GR6tLxYJu
         QCMghDG+Fr4ftJLatOKIuacAiEnNogh8zSvkyXv91WE7RlQHbcsFOjDaZ3BpFiY/zHlf
         kM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283877; x=1795888677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dxaFlJRZuXJMii9iS5rhrUq3M78QjQcIGXNp7AQ9tg=;
        b=XxLN5BmsDW+B/tUck5rjwdffLR5wKcp1fn+H2BS+Yfq/S8vhgD/TF9lqZrT64GpALa
         hGacrVoxwFU1xibW8xtnZL5DHoP6Du83X2mPWB3JP9qZUu4fdVU2wi5SyRVBZwPbjmKc
         1N/RsHxd9sdcP/uXIOj38ZfgbwYI3w2tCK272/fdEZLzeKdpy1HpmKZvBwquDCJSoOXl
         Dpl8vv+qvRf2qFL1UQsTDj7nk8RuOFfoxNO2TtdqvGrJ8OrpG3SyJtwP+Km08d51nXBQ
         mYlrY3jEfGWmiez9PY0JVcbKUXsqgTWKg0PX7DpwtJqEsUzS2A7vaxu0SiwAt4h1+iMn
         OWwg==
X-Forwarded-Encrypted: i=1; AL+hErE9ZCwiaBjYgeu+6d1yOALL1GSheeK38y1Z3QWQ4+rGL0M2gnYCiEvTATAqt71e0mVpVpG1dEO3/15R74w=@vger.kernel.org
X-Gm-Message-State: APuU4Z81gYN3l2J5mw8MNu6YjwItf5/IIX0BbDjUTb0hYWfOHLfEfkUQ
	5+J2FrKYkZvH7S9996d2G1QYqSqHx5MlK/kXrWlXjibjkmvy0Ti2Bm+SJSxzpgA92Do1eGXuWtJ
	f6UhXjEK8tyMYoE6vcbQ6eQyhH6BhycA=
X-Gm-Gg: AZFdTZd7ruhNXh/jyaxKbEEjOnZY0WptFJhyC7tprZ5jiqvBEu/2lDDhNZ5dGqtbK9J
	nfTmb7pBQVZzGtBOQBHTKo6GzUdTBj6nbxGSFgI0K5KHgSlP4Ssxp+YeJCjM+x1XooRkThTJO+m
	qpkYqHgxl2b4IZ9KQZm52iX+ZcjxcTCbDwa+671JTA90LpE2DlPXYo9ryaM6O76XocDsKZnjzpp
	SIwRotcdVYGCHZYSbiCZKRf0foiMkTUxBmy2uSg7gWGTFNH5zlgb6VfP3irffWbOxacPREpmrNV
	iUe2zYLGYmJuY0F7XdbU07Bz/JIaMBYI9BhL0FTZfzDaio+SKOlcRNmCdIGRP/9htyI/A5nzf/0
	zxlb681hPCjuEKfDgSvGUXHugo5cy/bMDh21L4rs=
X-Received: by 2002:a05:690c:9b0b:b0:8b0:702f:2a69 with SMTP id
 00721157ae682-8b520500588mr37750997b3.39.1795283877275; Sat, 21 Nov 2026
 09:57:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com>
In-Reply-To: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 22 Nov 2026 02:57:46 +0900
X-Gm-Features: Aa3M54o-NmMelfecL-8e1chO9NJSddT-nsp3zPaudeABWyPskoPrY6_ORqOpIUA
Message-ID: <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: re-check firmware idle state before
 runtime suspend
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baihui,

On Wed, Nov 11, 2026 at 6:29=E2=80=AFPM Baihui Liang
<liangbaihui@linux.spacemit.com> wrote:
>
> pvr_power_device_idle() rejects runtime suspend while the firmware
> hasn't reached ROGUE_FWIF_POW_IDLE. The PM core doesn't reschedule
> idle notification after rejection, so no further pm_runtime_put()
> arrives on an idle GPU and the device stays powered indefinitely.
>
> Move the idle check into pvr_power_device_suspend() and return -EBUSY
> after pm_runtime_mark_last_busy() so the PM core reschedules the
> autosuspend timer and retries until the firmware is idle.

My understanding of Sashiko's point (correct me if I'm wrong):

- pvr_remove(): must power off unconditionally
- runtime suspend: power off only once idle (-EBUSY otherwise)

Since remove goes through the suspend callback, it can now skip the
power-off on -EBUSY.

Moving the idle check into runtime suspend looks right to me, so how
about keeping just the power-off logic in a common helper, called by
runtime suspend after the idle check and by remove directly? Roughly:

  pvr_power_device_off()        /* fw_disable + power_off */

  pvr_remove()
      pm_runtime_disable();
      if (!pm_runtime_status_suspended()) {
          pvr_power_device_off();
          pm_runtime_set_suspended();
      }
      pm_runtime_enable();      /* balance devm_pm_runtime_enable() */

--=20
Thanks,
Gyeyoung
