Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794939219;
	b=fyhVZgULOfHHjAU+DXNTqdNL51j4jZZrWLpgO3CL4tRlEalR6Ftz3bENM2u5ICd01vvB
	 rkdRZycPtgdq3q11/wf39MKJBe79frfZEQFilVn4IE+nncVLYbIPT/5AwoGNa1uwsWtFx
	 /+Dov2m6/iY4PKfpiurGx9AQs6F3sDTH3Mq6QQQ3zmi6qDpZEppPmeT/il1szC/HuQ9jk
	 NagZUjA7rbnQDgKnDz3d6l5twfrKQ936wR5e2oZ1PBLO+FfG8CBqKj6gVHWS0XW1fSf5D
	 9oTbRk4hPlRiF4BkbHgRypM1jjNlY5p+gE5eowuDjvNffqcvgHiG/IU7ZJYcQq+07/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
	b=iON/elap8TJcEZWGO+3ex0e57utWdb9h8brdlR2/mFeWIhadaN+e5uHidp8EEEdv2Be7
	 mnMQF97lTaP+cEYmFmFN2UKlYHwAcBtG1Gwq+CaZGYMlIP/D8ugIzyDMd1Rsxy0v5/fNs
	 XReCaMFYKH0m/TRo+d5oYKyBl15klFcJXFzRggFOmEgDHcV9AeUraSwT+mMrTPry9kKwt
	 yBZBWHDLVKe/O9MijhSIuLEXAVvXhW9Mvtkbn69/AEtTSW4u1NbD3Knv6L1C3mc498mq8
	 zybu9g3pZqy85A12nUxRfpiwbbSGaiTyqydR5YJoQOA7b4i3rhTBIJBi+PMS77Xa0AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF703606A8A4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF703606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yWq8fIRK
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae25c846edso1383011fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794939217; cv=none;
        d=google.com; s=arc-20260327;
        b=U9L+TpTav1pWN1XXB5KxT+SDizEClOuNZYkOH7Uv+EXAUjC8h8QGE6wPDAvgLJflRK
         uawKB5c6fjZc7xASsIlR+WcjfYWQt+iNLZdlvwWgn/tlVlAhkPTaYnO9UJTl8FWHTtLT
         rpflrwm7kma8t2dkjDNLHS5OgULDEDhfvgNRgeQzPH2qpeDqFPlwOGB0ZK/jjZ46VBq8
         0xbAZIHz6YTiwzJ9cxmT/ckUeyr+z/h1RApfH5KhzBzh2+WaGMtgjMEq2VgUwjjD4Xgf
         KaXf7d+Lde6gdeBV+opTUjclrYURxOKwUnJhr3svfbRBtaM4cAJtBEB3TlLlbOqHTWWi
         rYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        fh=Sw+CXiVvJDa3qcVyLWWwYav/r8Rl5npwdkk0LtJbKwc=;
        b=MMN/kwaYwoH/MoPTt3aE+LjTiteSYxDKCnFB55US6+IFZitiZqSLfx9exGum/jJP7U
         7VD4bM4mirXR/5vx2vndylyODNHG8JiUr4wgV9+q/rt1PSig9lpdi1M4zPXLkqt4Gc0z
         oU0kExT7o2vnV/ovesZTHkXGerDP+GADNVqDPdXkmofU5Fyqz+c7XLlKs5pwkupI96Ad
         lHzPsibylBpCA4r+R35CsLcityXgDCtP8hPD4dBBGT2VQfyvi/2ueRvKP4LMoTvdUVQJ
         qynhE+NfYrU67QxzvZXi8nFH2xl+r9kkdfdmzZ2bgFRdDZKj+vNO4+xtxofuv8GthxZj
         KDDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939217; x=1795544017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=yWq8fIRKsYvOVYJkN+zuhrDf5zzTzUqBNqndE5f6I0NuyPm5k1QYBU1TxuA6LUrayP
         u9g/rJO1y8oNXunkiwTxK/PEnIDGWko/TH/y6fdqeoZVr5MsQ38hY+z2KpG3sgq6BJWk
         Uk+PxgsWz4df/3Q3gszOS0a28AGCRXK7qrNrs1liYe8mvfvy0RnMZDm+HY4rEK2OLNdl
         D2O2ciFFGs/v3uIhVFRIcdDMCp1tY8Cx2whBmtqPrFLKaSr1dI29ZNSeJFdbxCrEUFQW
         HB6ed0+jh3NibJOScnRUnJw3EhuLteXt9rttaO5Wl9w1CYEPMjG8/8bAlAkv7VxP311K
         I4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939217; x=1795544017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erlUER00uutbOeUXRe0dMlrIK7k5YTIn1N9SBf2g4jc=;
        b=mrRl4zGF0dGQ89NiZV7So0xVxr1IEEBynH9+g0Fh2bnyS4oIcte17z0Cj7WZfd5sxJ
         dxDaE0cOycy1idKpgitmiCYPgD53CbnRnazd2PGPz77HFp8nCkcXVgDPdtrii/D1XsFh
         8eOd/+RNdM9WMFlOdCGWeYWPpMbKLAb3+xehxAHOieiMIN7Lw4QhxS9j6o3Idco3vMaM
         NJQPvkxlTcDfo/zmiLMXI6ChleIJDtFLJV7nEoNCL4geFmvrbkBp3QCWt4FVL7Za7Alk
         G2Wh5yzU4DNiGTZLKiNXC0BC6XiPKHd2TuF17iOYrxdo4uqxCU7gGdq3EUeISDhivDeH
         1hrw==
X-Forwarded-Encrypted: i=1; AL+hErEddCgGe/kF1c3xFMOM9JC7g2yZ/w2WhAG0QehATeV+gplGRM6d+MGprgf56ARV0XSFiru+D/A+j75h8oY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T3fQOaBo2xHs/hF5LfCsvVgK4AhrT/voQd+SMF/PKL8K4TE1e
	1JQLIQ09MTToEz1dU08if7lSfszneGyfqpZ984WeDbCdLEB/5DLTvbQAG6lNHZDY7AzwITzohdt
	wudTmm8fkV6g4PMxUtoT0oMjAfRx/7cs=
X-Gm-Gg: AYBFou0nM6cwTblHsmmoweF1dSV5kjj/NxgfXnl0RAU+7MnoeEVSWdZKUEZzRriwgY1
	HmbhU3RskaEevaDuSeQhYKz80rh50nP3/1guh0t/ajxHjwNSkRQGd/SIdnWQbsl98IUS6yjH7Si
	R6PayHrQKZ348thB8BtJopMb2a44BY5kXfbfpU2N0jmRScB8tHmxp3YmLL3h3uZPC343GnrHLuB
	Q7q/toVHDdz4aow45A8w0k20ZIuiNZ84RdrIvwLQbQ15KT9Ez3nlksVhsUxl6Ere69KOZX2+RQC
	ptZtABwujQD71Gn1sHDX/kEWdYdscEdF2pbOfVlWiZcaeyOyv6781I1yCXxIDMzF4LxJXsp2cBB
	e4Rbvl1ORPlIPgObMnzLuV7TeFQirfqY4otH/1Zu3GT+CCp/umLw0cupSfpZfrvc2Egm/TPUphn
	kL2JXbpf/VGeF1KClT0yIpq3eVQMzClERaFbWqHerqS3KD5dA=
X-Received: by 2002:a2e:ab0c:0:b0:3ab:f9b:974 with SMTP id 38308e7fff4ca-3ae2b6b6de0mr41375121fa.29.1794939216626;
 Tue, 17 Nov 2026 10:13:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com> <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
In-Reply-To: <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:23 -0500
X-Gm-Features: AclHuK_oNiRl-U7dZo5t_PUbIvckg4PZjah-4kUWpzh4pr8I4MHJijK9LPm47r0
Message-ID: <CAEdQ38G0hC3QvZrM-YLUGUT=0DQqjJi=G=CWu=2fUwZLs1wLBQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> This is not how the update_interval is supposed to be used. update_interv=
al
> is expected to be programmed into the chip.
>
> Soft intervals should be hard-coded.

Understood. v3 drops the update_interval attribute and refreshes a unit
at most once every 10 seconds.

Thanks,
Matt
