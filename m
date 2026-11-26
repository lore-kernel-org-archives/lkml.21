Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661118;
	b=qE34nYw8YFNMLbnvRdUJ7MJ5/uxJCWM0nHj+4dFDJihNwgZCZx0mO6OGp0da2T1/oz1o
	 JTvlJTnX08PdjZV5KuZYMxhtlYeCTE4xUga3Gp7uoIR+S1Dm/B3Mif4DMS9DR8dIXwXSw
	 4+AYxP+MCeHqCMWvfFz4PsCUjCS1d1M5pSLhkWIXgFdJaAdEu0GcDWlq1DuVpe0P65tJ9
	 fS20Ue01CW4Gb0EugkPDuOvVUJIrhUckviA/XI2dy/DbaHLEod1wm1GA/q+3elndQr/Y0
	 EwwBDEsUv9xd+bpTiwSfxwRzsXgHPi55OgDpTyWtzGGzAv37bA5arws2lMzmZVdcScA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7GlQETt5WeF9RW01TOjSC+PQOreKfokGpSVrHkh5SZ0=;
	b=dSe8Inu3gQ3f4jCBWZ/F84xuB7reLCChQx17kaN+5l04hXlGHzz7uFW0+F4a3ZFwXbcG
	 5AutKafgRMkaxw4+GNEKKrOBPsGX0tqrqq3dT029RhD50T02HWg+ZXnV0kzufUurQQfOn
	 nywTWn+tzZWeRc3M68tf9vuS7l190lWaPGnVU5NNNluCaaJxRRceQ7pl9LrLPVBKH8UXg
	 G+TwU2cuMRfgVWi5V4zErsqYwgSQ3nTZReQmo+CNga09IOr66vH9LPwae7Hc8tevfuZPU
	 gIv3WVyC/YKZhGZnKS6bUGfOiFhGihMseFod3sW6MCu2SwcTFoQ9fE0FNeu5/hIiRkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=j0HtFaWB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A4606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 996A4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=j0HtFaWB
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6767d92cde6so7242482d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661117; cv=none;
        d=google.com; s=arc-20260327;
        b=Cs+dcCeiNIPQizTlZ3x6dpg0Ax3naBXPaXNCiuIjLwmvCgK0eDMtc9j/rY9zRlBloy
         4M2p+KbqflJTWZLDrH+JF4qs4cL/8KlaXwHjLU2aZr/XeKmi97VFsNuu6M59RUfUl+rO
         fAD3CPtXIfjGx0N7CLXN/Ya7nXu+9cbMlkSEroD8NkPtTeFoSfm9keWHZq8N2H5jzBxO
         DCzjTUQzDT3eZOQoV74RvtZb/I7qOuil2Lyx/j85cBHNtlHPNfJLtfYIYs4eU0VPNy4P
         ZNaWbh0r8WcLmfqXCnNeUTga395kak2Bidk+k6LM1YFcgkfaSrcClbOYnZ/jTnpvSPXT
         0TDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7GlQETt5WeF9RW01TOjSC+PQOreKfokGpSVrHkh5SZ0=;
        fh=ZUf4K8hgbxEGYc0rd5lW64WF057KIsWTYcWxk4NllOk=;
        b=J4LU6dNhmw7l835IwMzJnIhXkQU3jCLRT9JqxxJYjmj/6dIFYaThcX3Krr/HAjY7Yc
         rDJZub8UorhGErcKxFQgQWjk36iT9UfP23esOE6dHbwATFz1+wBJpAE7SZ+QAQG2LWtT
         sws0CitMGaw2EcM7nADvEnqaZhOlZYq0pVeX+9rETqiyl+LWvnSb5EaW3WGvAqxkjqZw
         Bvafr0MVotBDBhJUIMZo48a8jw8imEV8pGNdpCFDakJyqW9ydxdCyAq4/AXQZaFjwhEn
         QUgCpm7h/0n9jiHBCE75SOTtc8/MI9hguL5l92ugLkBZ7jlrHgG+VmdA6pD5ysOInhyy
         ypLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661117; x=1796265917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GlQETt5WeF9RW01TOjSC+PQOreKfokGpSVrHkh5SZ0=;
        b=j0HtFaWBHYJafCAM4FYpMBr/6P7rW5gahhNqWBcFB8MrNDC48o3on2tngLQkZR47U9
         lQQWcYdOqRGYJZvHimCksVA8iiz02dCtBqn83vJpeyNG3Mr4a6eOJdZ57JZU5cvdpXzN
         LMVhkBSV6591Vv++hAzTRYG3cTEIec+Lx9OZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661117; x=1796265917;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7GlQETt5WeF9RW01TOjSC+PQOreKfokGpSVrHkh5SZ0=;
        b=1Yu20J8PTgTsDnJ290JcDoWzGInBg3RalxVIk2NbIuDboiKUvAgSAk8rQkVbp8p8z0
         ASg6sOCi7DS9Yr+2+QNdywKNeLDhY6ZHsxeOMxWx/2/rJjVeKZfBGqJNxt8eH7n8ANmC
         vuZar6tARvsdNyw+8NDk5GfjlZQKOrwb+Bisz/ddXtXUxArtIQzgcym/6ZZzxAyssyvN
         cazbI0dDsHiOARiGjJNWkz9uJdUWvlTLGmvRUlsQhSq84BL8HyrCH44rOeDf6as/SfMp
         u94aR0q7lMyT7HL94JD5znsN5wzu+6kACgQTYnGGwwOPVvmTelf0Q9kH9/0fRYL7N141
         O4zA==
X-Forwarded-Encrypted: i=1; AL+hErEQ2nMkcQfcWMQnebGFVxgke9XTymBvWxXv4yPl4N9z7gMm2irhx6n61ShwcRbuYP57gKYUmLO0EDjTgDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k2PtwwfdAhKymEPrKk7NG2imOdZ9jIM6OUqGXX27ejK4wCFjT
	dz18nKaYgppJ3Qk11mOP39QVyyMSTUTIcn0CVU5Q4P0QR5496BXWFrRP6UalBl0tMDQ7fdeDl2i
	p767/q1dYmLZEdxbhu6GHMiOfZzX4IE3nBtDUb59C2g==
X-Gm-Gg: AZFdTZcc/iDhJV5CRjIWM5hw47ySDcEg0vsa7Ck9oir/9wIZcoQR2cnpjLxVsFzjaVY
	BGLtCEUxB4DYeV6YUx/pf78FzGbUZD5UxXZrW1ehU8p8eF8d0vcpQ67FtlLtSlP6wPhYyFzZN1t
	/HjI1zZSeP53ltgGplL121LQLLDB8STGhyJWEaJElY7IWniG9FuihC8H1wG4xBNvyElyfvyOIYw
	l7PLVBXwEJq0fLVdUZVn+EVe9o99P8SVL7ReRFdADWMGCLawd4nYkSdm4bNdYpV6y28jHYADD8e
	B9vZOLOwEScjU4dhgOp89cUfOPXeEC5+wEdt+uJPvrKsV8LfGm/Jumnyq8uOj0q3PO0ST9WzI83
	k3lpm9Z6oKTuZkTH+Xs41PDWaAWw3wlA1irkqt0rYaZgO3ktG1Q4U4vywsC6Y1TnHMJoeu1AVJ3
	q19uWMSY+nV6ZGfBgTxa3/pIDXMLI9bqA3KCBa+BTLNPExNN0f4S9JUOO3b/KzyTgO6780Nd+Zy
	2gBVxpo6DKFebQYFFHahGTI5HDjWWgFZ/gu2A==
X-Received: by 2002:a05:690e:144a:b0:67c:1fba:b42c with SMTP id
 956f58d0204a3-67e03d05ec5mr8272137d50.45.1795661116604; Wed, 25 Nov 2026
 18:45:16 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 20:45:15 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dickson Wu <dickson.wu@certik.com>
Date: Wed, 25 Nov 2026 20:45:15 -0600
X-Gm-Features: Aa3M54ozbwzUaP7eZMD-IzxUqkqe5LLJflJpQube0AAB3rmNBl6zLC3mCEarIp8
Message-ID: <CAFaZ9erowDbi7GrV_kK+7LLqXZeBoH3cv=Ectq6k6TAZ3MPbMQ@mail.gmail.com>
Subject: [PATCH 5.10.y 0/2] pid_namespace: prevent TIF_NOTIFY_SIGNAL from
 interrupting the reaper
To: stable@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This backports the fix for CVE-2026-99244 to 5.10.y:

  22b7f491be8f signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
  5c0985dd3c32 pid_namespace: prevent TIF_NOTIFY_SIGNAL from
interrupting the reaper

6.1.y and newer already have both. Two changes for 5.10:
- 0x00800000, the bit upstream uses for PF_NO_NOTIFY_SIGNAL, is still
  PF_SWAPWRITE here, so patch 1 uses the unused 0x01000000 instead.
- Patch 2 calls no_notify_signal_save() and no_notify_signal_restore()
  directly instead of guard(no_notify_signal)(), restoring at the
  function's single return. guard() in the middle of that block adds a
  W=1 declaration-after-statement warning on this branch.

Tested on v5.10.275:
- x86_64 allmodconfig W=1 build of the touched signal and pid namespace
  objects, base vs patched, no new warnings
- defconfig boots under QEMU/KVM, and the existing pid_namespace
  regression_enomem selftest passes on base and patched
- No existing test forces task work to interrupt the reaper, so that
  path itself is untested.

I'm sending the same two for 5.15.y right after this.

The two patches follow as separate mails with the same "5.10.y n/2"
subjects. My mail setup can't thread them under this one, sorry about
that.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.

Thanks,
Dickson
