Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036412;
	b=pE/NsV/d9iZcOuiuBH4kcjBEAogCcSMEI0SeiH1IBLpyB77rBuRITuuVIFIndl7hb7uQ
	 uLvlwvV+fX8mzVX8j/VVdtRKBmUKjr36nitRuX5u3igZfP0n0d18oXzlV2qsd2KHJavVo
	 u0o5M7NA5SZR4ew6MOj6K9+HV88L6xlkzDHHiSD1J+nejuV5RcYK6rXkekTOaxf0ISCkl
	 KRDmUIlbuD8pBGaeEnl3yK/MTK7KJFQQZfYmm/lBZ3nQVVfMIAc2g7owNDF4qOR0N2CBe
	 zn09zgLJbR3PRpHNNN4hkKO/Cp07+j+MwOAUBYG23ZLTauFgeDWmunpKMFfZCqGHq1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036412;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=av6KlIGFYft04FjHFPawlMbjE+QKVE34bldXYF16QS8=;
	b=TQEzN7I52NQgo8HJDU4sHltFyoGw8Sf9UbIkslFAhVurxmskVHvrTqIR6Svk3S8SLxFY
	 N0I31jrG9UXShQe825Kz3KbgU/4G+JjZD+/WhLVoZZIcozJIPE4izZ/ltVOZSaTTnx6kf
	 kyLSWmLvRlfXaGGYxQk1sQaFwsGNNnSIJ+k/91nde76IzI7pfpEYLhszQ4JjkFcpKYrxl
	 hEggdDhfhlYoVJerr4J7K5x0SUsHRPVr73zODOUVUjBwi2gw1sAI1EWoYKZi71fmfI9q9
	 DFrgZqTn/bIkAhjCGe27KwV33SP9/V4J6jfkmmaSZrntSXkeo8/eTcG+lLEBgE4a54w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G5pkTMli;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8704C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8704C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G5pkTMli
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1341831a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036411; x=1795641211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=av6KlIGFYft04FjHFPawlMbjE+QKVE34bldXYF16QS8=;
        b=W9s7D1Q/7ZZFBCgun6cnH9+i+rU21vIqEmrzvHxyDsCpXQDyH0/wzBMqzqZ9XvFOAy
         0HZF+1zAPn6WOT9KAgvy6H9yAeMwEP/Pf1seAuGXEi28L95ZcWRLG2U6I/x0wND+biyF
         Hdu4YuqGPG3ow8tB1wsEEvR41Gu0HsDVQSH0zqY0GtTth/tY6vLHgiSmQgk4ZaOYWqGI
         AiygskT0l6HYCLBBWz8m4G5JdbgX7uKCg2EAMuumJPP8VqnkSNDtBhR4hqQcYWqLLHJJ
         tkYvhaLhcpXVWnlCfwjDy6coxQ79fApzkzeecsAVNmpf4Hvbb8QI32XmmFl0DT27SU8y
         mWWQ==
X-Forwarded-Encrypted: i=1; AL+hErF9u1fSL3kyaWZv/Qh8Xs1E8smN5/GZ7/Ce5ONmdntN14ZZ3wEkQ/S0HWC5+eElRciBXffAp+qLNcvMBx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NOkwl71IJD4ZGkM/w+SzFf7lGJ5Lq9/orev5sDvrpO0Hc/tHo
	PCHBlogbW50DWlf78ZPSR5nzgvpho1lR4jms+GSAFsXrmzB2lh0zenoDR6vxoBS0SKtPUBYb4mK
	qWnwgmZ5tep9y8hSr4Ibkqx4Vvib9UHAilZMv5w1rT6l+QEz1ZFX+JVWL3xpOTDr4MHI5AhMcAa
	vf5WoWNFFbTLa+Z6ejpp0OAgKU31urE4tQAUb/eRkahn2r2CQ8szuUP/6nMIGVeHmSYVfzeHe4b
	WqIDc7swp3/h37F
X-Gm-Gg: AZFdTZdQXlX3tX/UjZ9bQJ6rFsj04l9JcdQrvFDdHSoqBvc3NvSckcgd4a+01LBsNcl
	i3Yh9PhMzFBXlKPXmnzqYl16mU8N6ZD/PQEHy2x7ZToAQLbmgFW2he50HNPMXPh+Kmc5I1OI989
	36HYbZqokFgO1npr9dZFVYiP2+2uRKqMkXmctWsYbY0AbAAl1u79h6vemDmZNEXxDqzviWC//Vg
	NyvvMSQ2K01U14cQGQ3HXiEIi+iUwM8UC5W/VV8JeRF4uDZD8mpi/4MjaNYdYWIBY9DwunWakZS
	Gm3VhkE/thBjFoGWqUsbY9wjr88pvuteSGTtxiLM1ukowxFw6kTx/miWuY7YooPT833jeed2IVj
	IR9Q4Km52SQsPo7fH6r4wOvAE0p1Uh/YDIdMRHAZ2tJh7Oy58vCwhkythGTVQNhXfHAWvzqaTzQ
	UZIq3Kaqb40bGPzcsIvheenzgbjrjQNOPT
X-Received: by 2002:a17:90b:448b:b0:3b0:9a1b:b6fe with SMTP id 98e67ed59e1d1-3b3d07e3bd2mr4081595a91.62.1795036410726;
        Wed, 18 Nov 2026 13:13:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6f5df9esm488714a91.7.2026.11.18.13.13.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 13:13:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50715e8328so40307266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795036409; x=1795641209; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=av6KlIGFYft04FjHFPawlMbjE+QKVE34bldXYF16QS8=;
        b=G5pkTMliSc7xudNbviz9Y+bG1Pb+hwg9n2fx3ZiqgKLKU6kMMAlFhf7zMXLYYt9Rh1
         0QGMTSR7ggcuKHLRYS3WIJSV2h2gWQ6i1YLBIWoypo6zzDrVEMdkLfZi1ZY1R7e4Ga5/
         l4XXI4zZvsyCGnEI4tJXT8Enfbr7KF5NsyiPg=
X-Forwarded-Encrypted: i=1; AL+hErEJGmA/v2obgdsUXLX/8j5Ex32ifWsNMTT0Hz4me0v6wqJsEm3aB4cqG9nYK/6+SMgZ007J8myEIYNk0pk=@vger.kernel.org
X-Received: by 2002:a17:906:99c4:b0:c49:a571:c4f9 with SMTP id a640c23a62f3a-c510e0e889bmr388428066b.13.1795036408787;
        Wed, 18 Nov 2026 13:13:28 -0800 (PST)
X-Received: by 2002:a17:906:99c4:b0:c49:a571:c4f9 with SMTP id
 a640c23a62f3a-c510e0e889bmr388426466b.13.1795036408335; Wed, 18 Nov 2026
 13:13:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106034419.134545-2-oss.patchbox@gmail.com>
In-Reply-To: <20261106034419.134545-2-oss.patchbox@gmail.com>
From: Vishnu Dasa <vishnu.dasa@broadcom.com>
Date: Wed, 18 Nov 2026 13:13:15 -0800
X-Gm-Features: AclHuK8sidDEIBCr3qYec3--SBWuWYbwN8NPWCQraatTaOmpXGCFfKc74uN9OI4
Message-ID: <CAF+opq0Yvs1D-4=Gd7_cvHFjHzy4C3NZdxpp939nAPYSgMOHkw@mail.gmail.com>
Subject: Re: [PATCH v1] misc: vmw_vmci: Leak queue pair endpoint if detach
 fails on exit
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000085f5350660937bb1"

--00000000000085f5350660937bb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:44=E2=80=AFPM Yuho Choi <oss.patchbox@gmail.com> w=
rote:
>
> When the VMCI guest device is removed, vmci_qp_guest_endpoints_exit()
> asks the hypervisor to detach each remaining queue pair and then frees
> its queue pages with qp_guest_endpoint_destroy(), even if the detach
> hypercall failed.
>
> If the detach fails, the hypervisor may still have the queue pair, and
> the peer may keep writing to the queue pages after they have gone back
> to the page allocator. The device reset that follows in
> vmci_guest_remove_device() comes only after the pages have been freed.
>
> qp_detatch_guest_work() already handles the same failure by keeping the
> entry, because the peer "might still be accessing the shared memory",
> and leaves the cleanup to this exit path, which then frees it anyway.
>
> Leak the endpoint instead if the detach fails. This also keeps its
> handle in the resource table, so the handle is not given to a new queue
> pair while the hypervisor may still have the old one.
>
> Fixes: 06164d2b72aa ("VMCI: queue pairs implementation.")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>

Thanks for the fix. It makes sense.

> ---
> Compile-tested only (x86_64 with VMWARE_VMCI, W=3D1); I do not have
> a VMware setup to test it on.
>
>  drivers/misc/vmw_vmci/vmci_queue_pair.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_v=
mci/vmci_queue_pair.c
> index e1a11820be01..57a4f0ae4f49 100644
> --- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
> +++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
> @@ -2391,28 +2391,35 @@ int vmci_qp_broker_unmap(struct vmci_handle handl=
e,
>  /*
>   * Destroys all guest queue pair endpoints. If active guest queue
>   * pairs still exist, hypercalls to attempt detach from these
> - * queue pairs will be made. Any failure to detach is silently
> - * ignored.
> + * queue pairs will be made. If a detach fails, the endpoint is
> + * leaked, as the peer may still access its queues.

IMHO, this comment could be a little clearer. For example:

"Destroys all guest queue pair endpoints. If active guest queue pairs
still exist, hypercalls to attempt detach from these queue pairs will
be made.

If a detach hypercall fails, the hypervisor may still have the queue
pair's pages mapped. Freeing them can cause a use-after-free bug if
the peer continues to access the pages. The endpoint is therefore
intentionally leaked instead."

>   */
>  void vmci_qp_guest_endpoints_exit(void)
>  {
>         struct qp_entry *entry;
>         struct qp_guest_endpoint *ep;
> +       int result;
>
>         mutex_lock(&qp_guest_endpoints.mutex);
>
>         while ((entry =3D qp_list_get_head(&qp_guest_endpoints))) {
>                 ep =3D (struct qp_guest_endpoint *)entry;
> +               result =3D VMCI_SUCCESS;
>
>                 /* Don't make a hypercall for local queue_pairs. */
>                 if (!(entry->flags & VMCI_QPFLAG_LOCAL))
> -                       qp_detatch_hypercall(entry->handle);
> +                       result =3D qp_detatch_hypercall(entry->handle);
>
>                 /* We cannot fail the exit, so let's reset ref_count. */
>                 entry->ref_count =3D 0;
>                 qp_list_remove_entry(&qp_guest_endpoints, entry);
>
> -               qp_guest_endpoint_destroy(ep);
> +               /*
> +                * If the detach failed, the peer may still access the
> +                * queues, so leak the endpoint.
> +                */
> +               if (result >=3D VMCI_SUCCESS)
> +                       qp_guest_endpoint_destroy(ep);

Could you add an else branch that does a pr_warn() with the handle and
the detach result, so a leaked queue pair can be matched to a cause?
Otherwise, this intentional leak will be silent.

>         }
>
>         mutex_unlock(&qp_guest_endpoints.mutex);
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.43.0
>

--00000000000085f5350660937bb1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
R/NZ5tTafc0SyuWmEVyFR825FbSoi1HwMkY1/lsU/2Ny0PK1+9WamuvV11QKd2dN0bYDXrT9uWC/
Cw+IDnr+5S21lWL9xM3S7htf+QjbSezM58DicE0QLGoXIYZ98zGOum91sMMgq2YfQKCVeOcD/7SL
0tftIn9SftUtPTeRab5qssPI8Aqo18uk3WxLqQRQv57jHWDis/0CAwEAAaOCAdkwggHVMA4GA1Ud
DwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9zZWN1cmUu
Z2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYBBQUHMAGG
LWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNVHSAEXjBc
MAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcCARYmaHR0
cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBBBgNVHR8EOjA4
MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmww
IwYDVR0RBBwwGoEYdmlzaG51LmRhc2FAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwME
MB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBSDkmQlbsGdC/WLbyB/
f4VlMvD+ozANBgkqhkiG9w0BAQsFAAOCAgEAYv4/sGMrazXrWECSGMFJ6YIDir3jLsYCcD/xTMfS
bXSiWFQ/ZiFLbxfVV9JJKkkKR29ow0Eo1fBaZMCDhnax7746XJn6qJ0Iz5MyLKFB2DKt3UO2q1PB
+wh73XKXTx6FDnbFRDjtyam6uKjknIMrZcFVTyFwUiY9zKz5pK40OPx4ZzdWxOCKMnCblGOiqvS+
gHpKXHRfCd9Ul1teGR1+muz+L7fJfrx9WUBNDFFIhwZEevLSVo7wIoyT2PG0fIk2yjKCFOT3CVVy
E5LT/kzQHjq7Y36GeUxozu21FbrNYm4Ivlh1OV9suNl/3iN1j9kFAdgg/8QXh9USKmg2zaS/S9lc
1YYUOS+Epg0WBwhAwWtVym636KWqu4Esgz2XWX1260rHG0sIxkdxzvBwsUYpf3e1axBlOHHr1Jz+
vDtQVeBUS7fBAVDWnBJrKNn+jseGnpcqBDQSSNq1kB44XhKZFApne6lKSCqYkE3qXnr7Dp0CXm+G
pPoyxqxotis4l4Dl4A3btCkYLp/dzOS00M71f185BKufW7S/16rj/jVUzgz2AjGvM/OC0SWvGoB2
tDdyBMmW1/0xK5rKGnmfM07/k8agfS2J6eI1iWB35m1Ni2SoCoLGoLlvUA4OhexyRqMTTjyllKtA
0Z9TF7kzBYUx8Qa7zfaTaIsVorChiSjphpgxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlN
RSBDQSAyMDIzAgwcY9XKjV0+TQvViOkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIE
IBQHJUdZ32znZk8Vg40Ji/xECs4HUlzUQ3BJcnRpQawxMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
BwEwHAYJKoZIhvcNAQkFMQ8XDTI2MTExODIxMTMyOVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgB
ZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcw
CwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAfwc7TpFZCf87Mu43fFTKacFKbbuMPiuNEM
ADsIxvXT4UV9wtsS8oL6ZmFGxzT7466DHjz+XNnaa9PSTu8zeXLSEdNl1o7bqSdhHM/xikgbBJGT
aUmcwF467MYQwE1TSfsZEyO8k3geFRRBBabp0XXhBpj4f/W+4yjrE8I6QahU4OX/9YPcOkcZOIW1
zAZE5G2EgEZ3dZeLyQO0/PTsxw0Irc/OyNTXRRwUShuRRLcnKemszzUTmqWemg7x/mrl3QrK19j4
ZGDKrOATV7dx+ABsCT6BVWaUOwe0w3pLHp/qqy+c+avTGqb+it9AYehU3wPIYAf0rQHsruk5aGuf
1Bg=
--00000000000085f5350660937bb1--
