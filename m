Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770054;
	b=yU+gn053lvewSMPzWuW+ykw7+QVOkd4X2EBONr6bg7WUna8OWQ7NEFSdhPuULGgqlf7V
	 WSRP5YcRcixD2B5zXwt734IQOqNh2hbX6yLwq01zsHYoXDPTXxX10UaGfeKyoMNDfZaDe
	 mR00+vrgzTUQlfiizthlYoNwOl5hPkxArTj6Q2KBsgZkkxr6pGUSxyonnYmVBIP5kG0tz
	 hEcaZ+JugC23W/iL8MW3BnHP8UNoP8I896PqKc/uWEF4MXkppkuDoC6m9Bg7dM34tQ2im
	 OmytWgFQZGP9gDKaYjO/i7T5JpYscE8J7ppOSZ9bK66BgkpwgCL1ufrFTN7WHbyzPVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770054;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ea+D4XvQXS0wApj/sWZ9FEvJHF+Ta5tWsX5SDWfsCYA=;
	b=uIvXo5ZBDxOQ9OF/HbHt0iqpMMkzWzksVY2UrAl9JmLyhLzhcfIZxLuCkn8TqFivpRZU
	 LvOvlNhT6svWMiFSMUShISgQe/JBaKOALeIekfL/mEOl6p5GW3ho+/CZe0Y0sp9cVMS7z
	 qOfr8RL1LvOdJ/2IObAZNjDiT0CcI394+s82tnacaQsjwbGqtGyuqj4t6ndsxQX5yq+sN
	 JMZ3/xsJkFhApql9+bs+8WJFhPLDwci6ZteBdMOQ159ea4zG7jCHcmLXf+/PA7MzDRbfS
	 osRIsJlihPs2XpUsGPTAg5YJ+bUSDTNp/WeS+GXLqEbl03Rgx1QdplKUholwtPCOpXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A03606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A03606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0621eec70so55131355ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770053; x=1796374853;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ea+D4XvQXS0wApj/sWZ9FEvJHF+Ta5tWsX5SDWfsCYA=;
        b=CFYb9O/EDIco9AWJX/GcWXO/tXXWd6fMLOx5mAJe3JMcWvpKk+GAq5BZnd0tPqEyKR
         oubFcepXGFHbXvKf8mW6maKDmJ2QPlFuP9C9ZXOYe88oJTnm8YA2JVVqUPyOaPYMOkbU
         xWoJSf0imzEFxaji0x0FnWsGiglJYMwBljIqhm11diedd/8XpRAk+itTaRMrrn4UE25c
         ov4Ez9l7xu/68QztYxhQsvTXA5N8oUIqnjdLzvxVAHJkqMOSGf4hUwoWv/QLOG2PWvAy
         70udgJ0epcA+d6Ug0uM1gGnmr3KJIZZgBmqibsjTbz78q8uAsgvY63xBBVgvsyfz1qOe
         oCQg==
X-Forwarded-Encrypted: i=1; AL+hErFBodBlEWNP2bjy2k7VUNreUttfdAlPy2fPu3R/0xbYG3Ca8qsDtx/TYJW5Wd223/G0vyCIMeYdsRovK8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d5ceSd0HvWG8OpxkD3nqPvsTE8mDL/J0L+86JZgCu3k3OpeRa
	MXRpRlZZKWu0VvLRpPtV9te0bLBwKbZKvKnAWrA3Fbe/ANrlxzxDM61u
X-Gm-Gg: AZFdTZfaHTWuzudT0XHo0+V8sAQmumeY0zCpS/8mERhXTxYeb51O9F5jvyFGaTaNGt/
	wHjiydNBN9ieaq3LSnKtVv2TKsN3aGUEFQzvcdFEqkK9oCSiq5fNL1wg591dEKBQp3Kis/5t2Sc
	X0cbocNn5qvoEly2TN/GcSjqmvr+Gu/JDd7qEThNsM8fb3y6F8nj3gb8IDPCnP9WPygkD4o3Jvg
	nwF8KwPistGiYxczTRrn/Ez/wVmG2yAWBRcpEPMLOuE86BJnha5Gti6Lw70hNDt7PX+VYjA12AF
	eUtBIT8Tnwfv6/DjMa3zaiG1Q7NiCOnwm1O3MrhY5L9u+9hldpH4FQkIOONEIB3vFpT/3Apu/9/
	dj85tr5GS3ViYll4RXM7JnQrCFfo88tA0eY0Bri8QFO2l4eKsGFY3j81NUssxqgq5oz8Mp20H0X
	OPXVyTrDQmRlJQEkyDKHjhLkDts2dJWXfglUPXsenzWSZa3Jnsp6Es9JSG7Z7stQx6VkNrBXIqe
	CfsqzBzrlLeN7t5Y3ZMOtb5glZxigaQWAwuHruxmAZeqc1Aqe8Y7j0nowWmiRJ+BkwdytOrnNn6
	jaOnzJRZ/APPFCvaO5IfKHPh60uPHIo9W+MkXy3GFB7ADqXflkFYOkQl4+pPnlncLFMgRTSggEc
	ZymQb468N6mffkH8rSeQVIJujnB2Kq/RyUiWlDvbVi7eK1/A=
X-Received: by 2002:a17:902:e88e:b0:2f0:4f8d:377a with SMTP id d9443c01a7336-2f04f8d38d3mr223125215ad.34.1795770053050;
        Fri, 27 Nov 2026 01:00:53 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:00:52 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: speakup@linux-speakup.org, linux-kernel@vger.kernel.org,
 chris@the-brannons.com, kirk@reisers.ca, w.d.hubbs@gmail.com,
 stable@vger.kernel.org
Subject:
 [PATCH RESEND v3 3/4] speakup: Guard late sysfs operations on speakup_kobj
Date: Fri, 27 Nov 2026 17:00:49 +0800
Message-ID: <179577004929.23588.12751621212376213236@kylinos.cn>
In-Reply-To: <179577002884.23588.802785530849276690@kylinos.cn>
References: <179577002884.23588.802785530849276690@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

speakup_kobj_init()'s error path and speakup_kobj_exit() drop the
kobject but do not clear the global pointer.  When built-in speakup
fails late in speakup_init() (e.g. a kthread_create() failure, whose
error path runs speakup_kobj_exit()), the dangling speakup_kobj
stays behind, and a later insmod of a synth driver feeds it to
sysfs_create_group() through synth_add() -> do_synth_init() - a
use-after-free.  Clear the pointer right after kobject_put(), so
the late sysfs_create_group() fails cleanly on its own NULL check.

The removal side needs the same guard: when the kobject setup
failed, a first insmod of a synth driver fails in do_synth_init()
with synth left set (that error path does not roll it back), and a
second insmod goes through synth_release(), whose
sysfs_remove_group() would now meet speakup_kobj =3D=3D NULL and crash
on the NULL kobject - a crash the NULL clear above would itself
introduce.  Skip the group removal when the kobject is gone.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/kobjects.c | 2 ++
 drivers/accessibility/speakup/synth.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accessibility/speakup/kobjects.c b/drivers/accessibility=
/speakup/kobjects.c
index a73b478e06de..e1860f8d9d42 100644
--- a/drivers/accessibility/speakup/kobjects.c
+++ b/drivers/accessibility/speakup/kobjects.c
@@ -1041,6 +1041,7 @@ int speakup_kobj_init(void)
 	sysfs_remove_group(speakup_kobj, &main_attr_group);
 err_speakup:
 	kobject_put(speakup_kobj);
+	speakup_kobj =3D NULL;
 err_acc:
 	kobject_put(accessibility_kobj);
 out:
@@ -1052,5 +1053,6 @@ void speakup_kobj_exit(void)
 	sysfs_remove_group(speakup_kobj, &i18n_attr_group);
 	sysfs_remove_group(speakup_kobj, &main_attr_group);
 	kobject_put(speakup_kobj);
+	speakup_kobj =3D NULL;
 	kobject_put(accessibility_kobj);
 }
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 40870949b3c6..1af80eb116af 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -580,7 +580,7 @@ void synth_release(void)
 		wake_up_process(task);
 	rcu_read_unlock();
 	wait_event(synth_catch_up_waitq, !atomic_read(&synth_catch_up_count));
-	if (synth->attributes.name)
+	if (synth->attributes.name && speakup_kobj)
 		sysfs_remove_group(speakup_kobj, &synth->attributes);
 	for (var =3D synth->vars; var->var_id !=3D MAXVARS; var++)
 		speakup_unregister_var(var->var_id);
--=20
2.32.0

