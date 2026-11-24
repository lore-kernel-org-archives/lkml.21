Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530049;
	b=22fMoB0dwDRNsh+lxSESSYhIRy8wqERCVnvXKGo9BNB8oidZr045TNzaQIGvcKE9G7Wb
	 WYfia65wGmGXHo0jY0WiuodKMkWQYtxc3ZkZ1is9ycC9NLKnhtpNzUIYfGrf3LXbFiJt3
	 dCTvpLcpG/GFrc/Z1KkyzV1pz0ocCr8xBU/FQODYzJRB88fdmWIBgLf9A0281rOwAJeZN
	 j6hpZ1NV5R67H/daLSGyrG1McvG7Qc6blQiN+qaxofvJ0W4yw+VFYtbMkR4pgvW/Ha6cu
	 AB3M9Q66CaAES6WN+V4F5eGYfaiScov3nfVxNz1GorqrbYO3Kz64I3f6u3L81BA88/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y0h22hVZxbtmWk7yVQqewBkuV98pktZusJwPn6z69Yw=;
	b=V7w6nOvxFFdMfVAlRypFfbe3R4N78VGzxwoDVpLWOs7wgFwpE/ehJev6pkIufTyl/g+Z
	 jj03LrsdR9m+mJ86H8YAUyAOr6A0FpQ4miHUxKd/JDtjlOxIkg6ZpVFnjM5YV1/tFBSjR
	 SGFNDBWEe+UOc+sdUI3YQAYM+L19qA7VhPeJtkZTrsZneJq4AFRpXv/0jB13eODftpQix
	 Ho72Nh2ATkeP3sFAKX/rw0uhmKUmJXCWqT2fhls+R63Cbk4Mjymhnsuz6tj2uhb21fwIO
	 mG4pZy/G+J5D8rnzVd5hK24H7hYSU4ivF9nOvberVbZAsn/1NpwTrRxH2YV5WBBZYpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJYylu9E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFAD606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFAD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJYylu9E
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18818daa3e7so2723082c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530048; cv=none;
        d=google.com; s=arc-20260327;
        b=qMtQij/VXkznIcigSfL7I43u5W3dNc5GwnFCXHoG/igt9P1hFofQHbcNGFFbLllmnj
         c6+pFLQ3GgxTXOSlZa6WnDmYPsuvqzPgJJD7LL44UqUDE+fqSdU4ufpIJSOTwJOYqSkr
         wphY7KHB1WngEdCEWA6POrtFiKgfLX46XOktCCuCdaWSDvKgnGzKvm8SqxnT6HxC3ghH
         hNsMK8f3wzDNWzkMyUT7Jt/KX3bVDUUFxWdBDX4b/b5HtR3pgicImjSpTkMHALmfABlw
         cXoFu7uGAp0hjUeZOVjKPpLFmWAxI19K6lSxAbUrAEMDeDxj+GjsYNeQAryS5FCY8qFD
         NlZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y0h22hVZxbtmWk7yVQqewBkuV98pktZusJwPn6z69Yw=;
        fh=uD3BnTWbsO3Qoj15lQWXioNqBbeDOsFWN7rgKZYLrdQ=;
        b=dT0D8EXn/8sP87O2RtOXDUWK6BNB+3UZgqpboLc24bmRc2D5QmnTBGWlZdvex482Vd
         5d9hUm7ffSEaJ1+WzpR523b9FGPCKeyU2U0NVwf1lLKG1orbKwTUV6Rfx+SkRXyDrlJ/
         YAX8tlE5A+rAk6oF7Ll7EjG85tVo39UbJJIV6y9988j4laSo8HPzzctsDlGqCCvrpOa9
         UYQGtV8oHZogVihlVAuyVvSBdOhEirz+kr3D17Wr1OXa5qPFlQlWV1vSuNTlWJ+bYVwd
         TZGI5iiRmTAeVRedxppcd0+HuX9qGXRzG9G/hoA3xNIBXG7TQOf0XUn/7alWCZ18Ry3l
         XBbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530048; x=1796134848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y0h22hVZxbtmWk7yVQqewBkuV98pktZusJwPn6z69Yw=;
        b=CJYylu9E8v3fGsQhDxIDvVuZ6KSDA3nvOFJj/4LXQvNZ/yfEhYIt6O41JQESuenVPk
         lWbn3UCPRSYmFWxFDqftRaDrZ9lc9QhCGE46ENnvhhue8Me6AWmEbqcKlf7wLBABK9oa
         3mE02y2f+9+14/q4hzWCinQSzGYjqj6adIK0AYIHWjrPvpsKpBQzz64z7pYSdmeWiiY6
         mgQOjNxLS2zC79krZtgtkxFv96sVj3puoIMQYlBnyOWYeOgYsOdF8MkT9n65OIJiIoIO
         e0lYCpkbmPVWzd2faLZjdUKVCAI3f1iitOPybfojYT8MnxhP66TAOE1TBKA929kFdJL5
         qJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530048; x=1796134848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0h22hVZxbtmWk7yVQqewBkuV98pktZusJwPn6z69Yw=;
        b=cNA5sv2Nd1ORo4baxEXM/m7IevfRE5wscMVekYOqWmV6ongdRWTvz/J8HXmIk250wf
         vGl2+rIfA4xUpiLugnhiIl4QmL6K4Oc3odUjegQPWXV8E21boh/L/jC1wIh1pUbGeF/9
         WfQI/g+xpf89FTU/nl/QZc/BVong8CdkTAzu9TkWAmG1xNltgC+7t6MEbFXvmK/o6FiE
         i/xlWdDy85zR2cMbVML/KMmIALaCdLhq+6Ku9XC2pFAg64wkEwruzFib/FO4fizPUKTX
         IV7Evy2lv5W29IHxhEuueuAX8P435uQVHbwXA610dyKZILL/T4+efQdc7e+PU5QLVEpt
         tgMA==
X-Forwarded-Encrypted: i=1; AL+hErEv7aScaG164U5QHddxrOpTqsSelm/CXq1gn44ZRXvjmowsKv+sTDwjdzk9pVVEgiKnoVpmXbV3qTs2zM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+hNefnHDhk3eC1bVtFF5YgLEsxviIzbIHIcdF+gsUxqaw3Dbi
	PEnnYi+tN3DL3TzerF5q+6oYZxF9y9bLv1zPXqBUfWvtrkOH3KPAJMZkd+ZavrKJGEThcfZBJlx
	XgjLpRfHMH0hH4LGizjbCl4GstuePRl8=
X-Gm-Gg: AZFdTZe205of5hnvPhw8y2SieUfVSofBN5TbsdtbUzE+xvCWqsLw4mgfB9yXTL71i26
	D7PGat4vYWeOg9iDXtyS7JlqJ5sHpVYsR5UefXAPCy3JB0q8QEONag6hYOjAhc8kWpcCpyTDwFJ
	3NtD6DUafn+mXMOp2C3RfcilthQCjiLPB3dbqOMxY5Fx4ulrWk7y2gDkjAlyEJEIi9tcnuY8KRl
	F2r9Vz5CNkXGGlQewf9EHb39zkNTAoBLiFHO1f1GqHkwLKAZR+1nqWr3zTLQvXVkSMMsCXEEktN
	TKPEyJSW1TFwvpoWsT+nSbuoeYSi/Q1RdAAr5WZQMb41j4xpsxveca8P8CnypzOhEj1ISbsb+Hn
	w8TxnSWG1NxuyFDQPcAQuzTVu4iR6LEiPfTpKaNM=
X-Received: by 2002:a05:7022:ea4f:b0:1b5:31ed:e23b with SMTP id
 a92af1059eb24-1b5568aac99mr12606778c88.6.1795530047559; Tue, 24 Nov 2026
 06:20:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123044347.3273-1-chenguoming88s@gmail.com>
 <20261123075116.3868-1-chenguoming88s@gmail.com> <DN2JJHBVAPCY.2CNUCGCO781D6@bootlin.com>
In-Reply-To: <DN2JJHBVAPCY.2CNUCGCO781D6@bootlin.com>
From: guoming chen <chenguoming88s@gmail.com>
Date: Tue, 24 Nov 2026 22:20:35 +0800
X-Gm-Features: Aa3M54pt207_jk8iesQauUtcEdhbIWiMbFM_TfJYFPmwgZG_F_2cdAtL7SC0sqE
Message-ID: <CAHNm3OizHNb0-N-E5Vrkv+2g69F=J47Cqirtnt9Z76EYvZBiJA@mail.gmail.com>
Subject: Re: [PATCH v4] usb: cdns3: fix NULL dereference in cdns_host_resume()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=
=8823=E6=97=A5=E5=91=A8=E4=B8=80 19:07=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello Guomin,
>
> On Mon Nov 23, 2026 at 8:51 AM CET, Guomin chen wrote:
> > From: Guoming Chen <chenguoming88s@gmail.com>
> >
> > cdns_host_resume() assumes that the xhci-hcd child is bound and passes
> > platform_get_drvdata() to hcd_to_xhci_priv() unchecked.  The child is
> > created by __cdns_host_init(), but xhci-plat probes it only when it
> > registers; cdns3/ precedes host/ in drivers/usb/Makefile, so with both
> > built in the child is registered before xhci-plat's initcall runs, and
> > with xhci-plat as a module it stays unbound until the module loads.
> > Platforms that allow runtime PM (cdns3-imx is the only in-tree user)
> > autosuspend the controller after 20 ms, so the parent may already be
> > suspended when the child is probed.
> >
> > Resuming the parent, either for the child's probe
> > (__driver_probe_device() calls pm_runtime_get_sync(dev->parent)) or on
> > a system-wide resume, runs cdns_host_resume() while the drvdata is
> > still NULL; xhci_plat_probe() sets it later via __usb_create_hcd().
> > hcd_to_xhci_priv(NULL) then dereferences NULL + offsetof(struct
> > usb_hcd, primary_hcd):
> >
> >   pc : usb_hcd_is_primary_hcd+0x0/0x1c
> >   lr : cdns_host_resume+0x24/0x44
> >
> > Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
> > only skips the callback when the role changes during resume, which is
> > not the case here.
> >
> > Return early when there is no hcd to notify: the host role can fail to
> > start after cdns_role_start() set cdns->role, or the child may not be
> > probed yet.  An unbound child has no state to restore, power_lost is
> > only consumed by an initialized host, and cdns_wakeup_irq() already
> > checks cdns->host_dev the same way.  Also publish cdns->host_dev only
> > after platform_device_add() succeeds: the error paths free the child
> > with platform_device_put() while the pointer stays set, and the next
> > resume would dereference freed memory instead of bailing out.
>
> Your commit is too long and robotic; didn't read!
>
> Reading the patch, you protect against two things:
>  - cdns->host_dev =3D=3D NULL
>  - platform_get_drvdata(cdns->host_dev) =3D=3D NULL
>
> Your commit message should say that out loud and give an exact way for
> those two to occur. It should also mention the hardware used to
> reproduce the issue, with full kernel panic log.
>
> Thanks,
Hi Th=C3=A9o,

thanks for the review.  You asked for the exact way each of the two
cases happens, the hardware it reproduces on, and the full panic log;
here is what I can share, plus what I plan for v5.  Machine identifiers
are redacted from the log.

Both NULL cases are reachable in the code:

- cdns->host_dev: cdns_role_start() sets cdns->role before calling the
  role's start callback and does not undo it when the callback fails.
  cdns_resume() then calls the role's resume callback regardless of the
  role driver's state, so cdns_host_resume() runs for the host role with
  cdns->host_dev =3D=3D NULL.

- the child's drvdata: __cdns_host_init() creates the xhci-hcd platform
  device, but the drvdata is set only in xhci_plat_probe(), by
  __usb_create_hcd().  The parent is resumed before that: when the child
  is first probed, __driver_probe_device() calls
  pm_runtime_get_sync(dev->parent) before really_probe(); a system
  resume can also arrive while the child is still unbound.

What matters for this bug is the configuration, not the board: the
glue enables runtime PM (CDNS3_DEFAULT_PM_RUNTIME_ALLOW), so
cdns3-plat.c uses a 20 ms autosuspend instead of pm_runtime_forbid(),
and the controller can already be suspended when xhci-plat registers.
cdns3/ is linked before host/ in drivers/usb/Makefile, so the child can
exist and stay unbound when xhci_plat_init() later registers its
driver.  The in-tree i.MX8QM glue sets the same quirk, so the window is
not specific to this platform.

The oops below is the second case.  The faulting address, 0x208, is
offsetof(struct usb_hcd, primary_hcd), read by usb_hcd_is_primary_hcd()
through hcd_to_xhci_priv(NULL).

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000208
Mem abort info:
  ESR =3D 0x0000000096000004
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x04: level 0 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[0000000000000208] user address but active_mm is swapper
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:

pstate: 81400009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
pc : usb_hcd_is_primary_hcd+0x0/0x1c
lr : cdns_host_resume+0x24/0x44
sp : ffff80008007ba40
x29: ffff80008007ba40
 x28: ffff0000993c8000
 x27: ffff0000a0a39148

x26: 0000000000000001
 x25: 0000000000000000
 x24: 0000000000000001

x23: 0000000000000002
 x22: ffff0000a0a39104
 x21: 0000000000000410

x20: 0000000000000000
 x19: 0000000000000000
 x18: 00000000ffffffff

x17: 2072657473696765
 x16: 722074616c705f69
 x15: 63687820746e6569

x14: 6c63203a5d6d7364
 x13: ffffc001a9b23dc8
 x12: 000000000000083d

x11: 00000000000002bf
 x10: 0000c001087aec88
 x9 : 0000000000000000

x8 : 0101010101010101
 x7 : ff7f7f7f7f7f7f7f
 x6 : 8080808080808080

x5 : 0000000000000023
 x4 : 1fffffffffffffff
 x3 : ffff0000a0a39c80

x2 : ffffc001a829e030
 x1 : 0000000000000000
 x0 : 0000000000000000

Call trace:
 usb_hcd_is_primary_hcd+0x0/0x1c (P)
 cdns_resume+0x50/0xdc
 cdnsp_controller_resume.isra.0+0x14c/0x198
 cdnsp_plat_runtime_resume+0x20/0x10c
 pm_generic_runtime_resume+0x2c/0x44
 __rpm_callback+0x48/0x1dc
 rpm_callback+0x74/0x80
 rpm_resume+0x44c/0x63c
 __pm_runtime_resume+0x4c/0x90
 __driver_probe_device+0x64/0x1a0
 driver_probe_device+0x3c/0x110
 __driver_attach+0xf4/0x1fc
 bus_for_each_dev+0x78/0xd8
 driver_attach+0x24/0x30
 bus_add_driver+0x110/0x234
 driver_register+0x60/0x128
 __platform_driver_register+0x24/0x30
 xhci_plat_init+0x44/0x50
 do_one_initcall+0x58/0x264
 kernel_init_freeable+0x1e4/0x3c0
 kernel_init+0x20/0x1dc
 ret_from_fork+0x10/0x20
Code: 52800003 f9407ca5 d63f00a0 17ffffe4 (f9410401)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Oops: Fatal exception

The fix returns early in both cases.  This does not weaken the path the
commit was added for: on a system resume the child is bound and
power_lost is still forwarded to xhci-plat exactly as before.  The
other hunk, publishing cdns->host_dev only after platform_device_add()
succeeds (reported by Sashiko in v4), keeps cdns_host_exit() and the
next resume from touching a child that an error path already freed.

The log is from a 6.18-based kernel, but the function at the crash
site is unchanged from mainline, and the v5 patch applies to current
mainline.

In v5 I will state both checks and the exact path that produces each
NULL in the commit message, and include the relevant frames of this
trace; the code is unchanged.  I will send v5 shortly.

Thanks,
Guoming
