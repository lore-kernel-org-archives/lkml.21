Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795523318;
	b=3cLNN9yMVawkRMu4Q2SGXmcMwgdWUXN8bDgeT8Z8usI1EJf1stS/RXJ2veYdB+Z6tSrB
	 mky0ibnaP3uCQUaEmqve5lNNcj3KRt2o1wKQU5COFxiaAk377I97Bv+8vYM/cdMoYkFAx
	 gZ/xcn1n6WF7N+ZMZDBt0Z+1lBIffzJcILFQde8pQHY59iInSS90xfix7FapHCThBozGR
	 fDZmfrk3f9tDJ+4kj300VuxVopY8DjrMuULKzTZaPiKqyzUFDW1oCUzLGD//KsW11lL4g
	 X8hGJeWcv9bdHiXYE5+OybDPz483tE3OFWOKS5sGW1lfOODNHIDiwki5YXRrgcFPx0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
	b=4iWR/icWqpATO5ai5epyFW/PyDyIodDNFy5vkUM9Q1/2RulxENhIrgugznq9mIu55Mob
	 pkc+ziAy9T26CFLj/sDAah7NNWi//TiAZwCL5E6gayFC5fPgmnbUBuWfWSIKbbkSvJE2h
	 4sHkEYvC0DWhE8j5r4WCzF/b2R/NmJvPo0DJCjBAtXMXazdzzFEGWwyg51Yucup6YiESW
	 +g0F8O/8aaXtw2CSEOfO8K+mLvpIK+jj0oD0YFCpSkxSZacGsekAagzmGpTgSe/6kaGgr
	 X4w/lm2srTfZ3kz7eKH56C950DzIygCVUyZ2hjX50OoZrB5TKTg2A4OlFY/Ich18D+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sf9Z9dX2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50278606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50278606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sf9Z9dX2
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so3742568a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795523317; cv=none;
        d=google.com; s=arc-20260327;
        b=ClTNvE1WkFU5FwmIG/Pv4B8nKcMr8FOpWzvpDpMEX/+5l7YdwIp1Vkac6K5dpS/bmX
         f/Xao8FQXMaj6i3+frt+Ug7A3ja76fuMCL+Ao4dDe8K223no23qIRprgg+SeqQwHGrNH
         5K3k/Dj+ykZmvNAx45ZtvWoC42qwor0GSmksLfEswPGIolvt2scLO0Nk7UkY9Mc6oHtF
         ZxXsW1bGZTN+AHqPBNZlCNfRVfWK8icN5tNSotZSbNnVXXRDYeeN4lbuxDZVG8YrM+8u
         PHV0r5CvunRfEtDgJ2UJGROV8kfenDhtGS58yjM9mH7SF+0KWQZHh2yPQVR9tHbDc4nb
         60WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        fh=43SXFpAPumO2V9uUCuV6gCMtV6ES0Q20fIA9vDJ7its=;
        b=XxAHqPlm1J8FBrVkR58BLymS4ner2BLFW9Po4kMeb+HFv82gl8pAE/SJWh7Lq+pKAL
         gI2dzIXBfmIsl0vInmYROqUwSj4LUw9qytynZxoycG2huLbQhdiZwHsP1tp0+8H6HbxD
         mmfHOUz4wbLbsDrWGpw84snomxlOdfIPIJRAJhla14goAmCWRVL8xdNgeuhlRDYInwtN
         2/TU8mp19eU8XsNy5tXYeiwvkohQKy8dAH7YnYqLaSM1o5nRGBGUHYZ9ZHgHrZjerwMp
         PNpGxL6aV4tJ9SsQG9RaZ8mAdNb80QdFUaCVEda3COe7Rfj+V1zt5iUZQaSOVzhcE5DZ
         6tNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523317; x=1796128117; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        b=sf9Z9dX2+gg2NDXT4apbOAfRMoPz0H+tzBc41iPOs99Hbvx44i1c5DwcxudwBWgm3H
         plc6cip008GPHJu9elvaBiTjT+HK9jDQKZDTczJ5RlbKWtke0L3r4l8jAL2N4l9xG1VY
         pgEMZAU5ULcoktR6hAD8T9bvTX6AOnQXwFJf9nz4hEJgp/GDH+VarVdR12pI9wZQ+S2R
         UXgCXLNEBzglxRu5fNkugHnBsQyf0n1gTHxvMhmoR5ZGRXZ2B6P2M+FEaRswMXn8KPmO
         PMlh9hhu7ivIH/nEK4JMTbthWXHSBWyE4EjFnHsxm1dc9Cvuc+vsgMLGCJ+ozyhNS16q
         Lutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523317; x=1796128117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        b=1eWSnEOV+t1FrFG7Mrugen2L3W/qiqlQdJeHJO+sgfgGYTptcIguIArUj65VFHEQ5z
         PQB7g+Vl3F0oe+dUB8lcolZjNYeWoSqpnDlI5l9fqHPNOKdaUkuwe6/qGyXmj0MGF6L5
         ws43P5Uw4YRSJGuAr9osFD+ce7CIK1jN7pgdddxqvzkpDmAG6MjY2h7TvvhBh62mjUQh
         Z3tArPozwlj9+XRXE/LEJ1BGVuYdNyIr0zxXFXwaN1whlDhMY697Vi6MaOK7v0SnFK7A
         Dmn+hG9cV3HB1CNdSbTBnqKdd8hdV6PNBqxh9+GWRS/j9m13teOfA8NYmDPY/hEmSM9D
         XuYQ==
X-Forwarded-Encrypted: i=1; AL+hErGGFpf0BDFmge3oIq42jtaFo9XM5quMTzXtHijuApoo0m0pqjNlSLu6i6KArPpfVhVMkw5fR+3qtB0dU9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MFLqwka4uvTGO6nHTbQ16jxBt+iEXGFkYLdz6uZtcbR9AZ2dt
	2VNUGvZjgMrT/4CBOKEyi+YKZk4b/P7StDbmu+xgTCFZKuQgaw/cOzKcrLfCLlJZw75S2ooz3Cu
	KO9x34K+Azv8yBayKChURT2nSvL/Pm/anQwtWysO9Dw==
X-Gm-Gg: AZFdTZe8JkObbPa+IRcx+yD8GUxjxxPvlZ20F+ZR/EUdhJzDFIBKrAmjZkhN7AC9nVC
	kJZ0EQCwv+z/bjbVGJlfk3VRT1S+zXDR/CeeSIB4auYd7l/aNFzLG5KcHHlXSZV1NouhC1wdUDJ
	c4WyIOrudboBk1YEYA+A8WqaJKrrDriRQrTa1SaADPexmc6Vp4fJkve2syhFZbWH+h1YLAjD5H9
	kcsUTiMXSejIvhPbHFzL6xsqmUyOvYVy2so/cCYcde8lIW1RftubAr06ndAFwR9i9hZNu0W4Apc
	7nniwWCGXDrzp+6oUTvL2oLBM7RN9asLeYdGh4F9s1UkaeTgqcWPAXHffWa+Q1kjr5quhGA85Qz
	BoiNZq/F1s50KMCIXcTz8RPufkHCDn9SQOsbWXNMxd8siGMftfeifTqivlcYbGcqjvkgN1b8=
X-Received: by 2002:a05:6402:1ed4:b0:6ba:6598:1392 with SMTP id
 4fb4d7f45d1cf-6ba6598149bmr7679171a12.8.1795523315933; Tue, 24 Nov 2026
 04:28:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org> <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
In-Reply-To: <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 12:28:24 +0000
X-Gm-Features: Aa3M54o6_q2ze_X5WV0lDS-4k9Z9r9IbiOz5WhjT-SYs0fIiqKLT_L-3r-75L7Q
Message-ID: <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for your series; it's great to see more Laguna support being posted.

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> reset, interrupt services, and more.

[..]

+++ b/drivers/soc/google/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config GOOGLE_CPM_MBA
+       tristate "Google Tensor CPM MailBox Array Interface"
+       depends on ARCH_GOOGLE || COMPILE_TEST
+       depends on MAILBOX

Should we also have "depends on OF"?

+       select AUXILIARY_BUS
+       help
+         Driver for interfacing with the Central Power Manager (CPM) MailBox
+         Array (MBA) found on Google Tensor SoCs. The driver provides APIs for
+         communication between the Application Processor and the CPM, and
+         is required by CPM client drivers such as clock, reset, power
+         domain, and more.

> diff --git a/drivers/soc/google/google-cpm-mba.c b/drivers/soc/google/google-cpm-mba.c
> new file mode 100644
> index 000000000000..629a071e202c
> --- /dev/null
> +++ b/drivers/soc/google/google-cpm-mba.c
> @@ -0,0 +1,964 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Google MailBox Array (MBA) CPM Interface
> + *
> + * Copyright 2023-2026 Google LLC
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/jiffies.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mailbox/goog-mba-message.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>

Missing `#include <linux/slab.h>` header here as later it calls
kfree(), kzalloc_obj().
This can cause "implicit declaration of function kfree / kzalloc_obj"
errors with COMPILE_TEST. Also similar issue in clk-cpm.c

> +
> +#include <soc/google/google-cpm-mba.h>
> +
> +#include "google-cpm-mba.h"
> +

[..]
> +static bool cpm_iface_is_valid_req(struct cpm_data *cpm,
> +                                  struct cpm_request *cpm_req)
> +{
> +       struct device *dev = cpm->dev;
> +
> +       if (!cpm_req) {
> +               dev_err(dev, "cpm_req is NULL\n");
> +               return false;
> +       }
> +
> +       if (!cpm_req->req_msg) {
> +               dev_err(dev, "cpm_req->req_msg is NULL\n");
> +               return false;
> +       }
> +
> +       if (cpm_req->msg_type > RESPONSE_MSG || cpm_req->msg_type < ONEWAY_MSG) {
> +               dev_err(dev, "Invalid msg_type: %d\n", cpm_req->msg_type);
> +               return false;
> +       }

Should cpm_req->dst_id also be range checked?

> +
> +       if (cpm_is_request_msg(cpm_req) && !cpm_req->resp_msg) {
> +               dev_err(dev, "cpm_req->resp_msg is NULL when msg_type is REQUEST_MSG\n");
> +               return false;
> +       }
> +
> +       if (cpm_is_response_msg(cpm_req)) {
> +               if (!goog_mba_q_get_valid(&cpm_req->resp_context)) {
> +                       dev_err(dev, "Invalid valid bit in resp_context: %#x\n",
> +                               cpm_req->resp_context);
> +                       return false;
> +               }
> +
> +               if (!cpm_is_response_header(&cpm_req->resp_context)) {
> +                       dev_err(dev, "Invalid response type in resp_context: %#x\n",
> +                               cpm_req->resp_context);
> +                       return false;
> +               }
> +       }
> +
> +       return true;
> +}
> +

[..]

> +
> +static int cpm_init_q_mode_proto(struct cpm_data *cpm)
> +{
> +       struct cpm_payload msg_payload = {};
> +       struct cpm_request req = {
> +               .msg_type = ONEWAY_MSG,
> +               .req_msg = &msg_payload,
> +       };
> +
> +       return __cpm_send_message(cpm, &req, GOOG_MBA_Q_INIT_PROTO_VAL, 0);

Do we want this to have an infinite timeout? If the CPM firmware never
responds, it will hang the boot (as MAX_SCHEDULE_TIMEOUT doesn't arm a
timer).
I guess it is game over anyway if the CPM firmware is dead, but it
would be nice to log an error and return from probe()


> +}
> +
> +static int cpm_init_q_mode(struct cpm_data *cpm)
> +{
> +       int ret;
> +
> +       ret = cpm_init_q_mode_proto(cpm);
> +       if (ret < 0)
> +               return ret;
> +
> +       cpm->seq_num = GOOG_MBA_Q_MIN_SEQ_VAL;
> +
> +       return 0;
> +}
> +
> +static void cpm_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       of_node_put(dev->of_node);
> +       kfree(adev);
> +}
> +
> +static void cpm_unregister_adev_action(void *data)
> +{
> +       struct auxiliary_device *adev = data;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +

Can we use devm_auxiliary_device_create() instead of open coding these?

> +static int cpm_register_adev(struct cpm_data *cpm, const char *name)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc_obj(*adev, GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = name;
> +       adev->id = 0;
> +       adev->dev.parent = cpm->dev;
> +       adev->dev.release = cpm_adev_release;
> +       device_set_of_node_from_dev(&adev->dev, cpm->dev);
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               of_node_put(adev->dev.of_node);
> +               kfree(adev);
> +               return ret;
> +       }
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(cpm->dev, cpm_unregister_adev_action, adev);
> +}
> +

[..]

> +
> +MODULE_DESCRIPTION("Google MBA CPM interface");
> +MODULE_AUTHOR("Lucas Wei <lucaswei@google.com>");

I think you should add Lucas Wei's SoB tag to the patch as part of the DCO

regards,

Peter
