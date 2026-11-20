Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179758;
	b=zdsG9IjEhhyRo3QPbxvuyV68Va07NOCROvmkXjs7LZjQVWWPAInpk3XltiIQKQcK80QR
	 LgxoIgPtfFNzSLRcXnh3gMK9fyfwY42ymyj/yeqXPW092R+cuKzlvmEZZUmkJdoD6/Qu9
	 BO5a+UAvMtXmwz3ZPjn+hi5Gd9BZad9jyLOs3WdDxIOwqre6RmiMSJMWyFjsXLXYKuPUl
	 IAGjkYLIDmHKCBLoeLiJAeLtcKf3iesOZQQpcgCwH8zTYjiyzDjBqBBTiWcc1AJ0abnGM
	 ScnCusq+oYXkYnD2VLgrV+sNpMcluyFn7MtJWPDNnYZjq2aohErMkLMVGxV8u7cORkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179758;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ti2OfGe5Wfev+BqPk8o1gBH+6PVamFDYmWAVzNs5Bz0=;
	b=RAjGnY3aH0ciYeOGbZQTogmPjqz42+vQO7EIKTcsT5by2KSmdVNkbYXsEj4YzhB79lrU
	 u8u9qdqIeauDr9/sCSGqjURdcHT+KPQi5QiOi4LhA0YY2ppZJA8ld/+rDnCqoLiGwLiaz
	 UUNTEdRNLIx6I5nqb5GWhYpkb1P2KhYHyyHq+kvCtpJ8vFMLhIP7Pq5JQp0CNAG2el31y
	 FjwkUxmlySaRPVz9AWgIR4mCR/fJcWkuQ8CFOFB05K2isJdqM+pFqyPlaL6yBrCbkeBYM
	 baYRjv9Qt9aNbKHHKh/ikGa2HqunRz33m1Jd/c/B5Qc5puqhtWUXzJNHR1e0v1umLNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBuRIPlU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEE606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBuRIPlU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E7C1F0093E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795179758;
	bh=ti2OfGe5Wfev+BqPk8o1gBH+6PVamFDYmWAVzNs5Bz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GBuRIPlUB69i04M3zW1/qGIupTmRXixeyNgIa1mpqnHSXEZJ/AX32mABtd89++leZ
	 hSFmwMUvi2boAQlaA6NfFpNPs87Q4Ae2wTo8ek5qdM/FFJiIYE17LIfaIqunoklXLO
	 lEVY2oKsbSA8h7EJf6WVcKf5yNEJzHDSTfTVnwMDjYnPc54IxkOs9dRBqqLWEHl2Fy
	 kUKoEZN3tHfeJhkxPLHUrveQiLqx52GP/FZzKLoGAm6hPKdcAFC5EhuzPkXxvbU8TN
	 /mQA+ETScvx6hJMhWCYN7h9ER2ovJleLP7VE6qW7tw69l+rwFQ/NWpKfjeezlkaLHE
	 mGLmu2MwpZT9g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfed9a887so7028011fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:02:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlcG1DLRZChO0d7Wft9Fzc7NqekzYE9j6NZbx9X+EUCON0Ku2t8kkxq2DPcnYNnQee1ACM0LjDA2+qR0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bjs5rdN+gutyyZoVElmhDBYwYpJFoKlTlr4WHfjGyOWsBlYcI
	9ul9ZvUCCi63SluhU0LLF6EfsZl/J+XUEcFPJarP20ajciV3WzRotZvRW9jqktlZFfT0HYcxC70
	aPm11phTt0KbuQfd4w2VM37MhaONMcAw=
X-Received: by 2002:a05:6512:3a89:b0:5c1:5975:66da with SMTP id
 2adb3069b0e04-5c1bc686852mr883165e87.2.1795179756815; Fri, 20 Nov 2026
 05:02:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113230248.3569097-1-jamien@nvidia.com>
In-Reply-To: <20261113230248.3569097-1-jamien@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 14:02:23 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0inbe=mHQvmtNpn-omjms9JEm0ROOoQOgrpW3nC_UqMLQ@mail.gmail.com>
X-Gm-Features: Aa3M54rs68VqpX-4uuwOAViNiwDZ6Hd9Cv6V3uWOm11hpkzlNBKGoAaX3wTUSko
Message-ID: <CAJZ5v0inbe=mHQvmtNpn-omjms9JEm0ROOoQOgrpW3nC_UqMLQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: sysfs: Serialize access to the table attribute list
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 12:03=E2=80=AFAM Jamie Nguyen <jamien@nvidia.com> w=
rote:
>
> acpi_table_attr_init() walks acpi_table_attr_list to pick the instance
> number for a table's sysfs file, and its callers then add the new entry
> to the list, but nothing serializes this. ACPICA drops its table lock
> before calling the table install handler, so tables installed at the
> same time can pick the same instance number:
>
>   sysfs: cannot create duplicate filename '/firmware/acpi/tables/dynamic/=
SSDT1'
>
> When this happens, the table is installed, but has no file under
> dynamic/. Concurrent list_add_tail() calls can also corrupt the list.
>
> Add a mutex around the instance lookup, the file creation and the list
> addition, and move the list addition into acpi_table_attr_init() so it
> is done under the mutex.
>
> Fixes: 7a37052adb5e ("ACPICA: Tables: Fix hidden logic related to acpi_tb=
_install_standard_table()")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
> Sashiko flagged this, as a pre-existing issue, in its review of my
> previous patch:
> https://sashiko.dev/#/patchset/20261110225452.2349540-1-jamien%40nvidia.c=
om
>
> Tested on an arm64 server (288 CPUs) and in QEMU (x86_64, 8 CPUs) by
> loading SSDTs through ACPI configfs from 8 to 64 processes at once:
> - Without this patch, 3 to 7 tables per run got a duplicate file name
>   and had no file under dynamic/.
> - With it, every table got its own file, with no lockdep or list
>   debugging warnings.
> - The boot table files are unchanged.
>
>  drivers/acpi/sysfs.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
> index d1b57d1246aafb1..47b816c588feedd 100644
> --- a/drivers/acpi/sysfs.c
> +++ b/drivers/acpi/sysfs.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/kstrtox.h>
>  #include <linux/moduleparam.h>
> +#include <linux/mutex.h>
>  #include <linux/string.h>
>
>  #include "internal.h"
> @@ -298,6 +299,7 @@ module_param_call(acpica_version, NULL, param_get_acp=
ica_version, NULL, 0444);
>   */
>
>  static LIST_HEAD(acpi_table_attr_list);
> +static DEFINE_MUTEX(acpi_table_attr_lock);
>  static struct kobject *tables_kobj;
>  static struct kobject *tables_data_kobj;
>  static struct kobject *dynamic_tables_kobj;
> @@ -348,6 +350,9 @@ static int acpi_table_attr_init(struct kobject *table=
s_obj,
>         struct acpi_table_header *header =3D NULL;
>         struct acpi_table_attr *attr =3D NULL;
>         char instance_str[ACPI_INST_SIZE];
> +       int ret;
> +
> +       guard(mutex)(&acpi_table_attr_lock);
>
>         sysfs_attr_init(&table_attr->attr.attr);
>         ACPI_COPY_NAMESEG(table_attr->name, table_header->signature);
> @@ -379,7 +384,12 @@ static int acpi_table_attr_init(struct kobject *tabl=
es_obj,
>         table_attr->attr.attr.name =3D table_attr->filename;
>         table_attr->attr.attr.mode =3D 0400;
>
> -       return sysfs_create_bin_file(tables_obj, &table_attr->attr);
> +       ret =3D sysfs_create_bin_file(tables_obj, &table_attr->attr);
> +       if (ret)
> +               return ret;
> +
> +       list_add_tail(&table_attr->node, &acpi_table_attr_list);
> +       return 0;
>  }
>
>  acpi_status acpi_sysfs_table_handler(u32 event, void *table, void *conte=
xt)
> @@ -397,7 +407,6 @@ acpi_status acpi_sysfs_table_handler(u32 event, void =
*table, void *context)
>                         kfree(table_attr);
>                         return AE_ERROR;
>                 }
> -               list_add_tail(&table_attr->node, &acpi_table_attr_list);
>                 break;
>         case ACPI_TABLE_EVENT_LOAD:
>         case ACPI_TABLE_EVENT_UNLOAD:
> @@ -604,7 +613,6 @@ static int acpi_tables_sysfs_init(void)
>                         acpi_put_table(table_header);
>                         break;
>                 }
> -               list_add_tail(&table_attr->node, &acpi_table_attr_list);
>                 acpi_table_data_init(table_header, table_attr);
>                 acpi_put_table(table_header);
>         }
>

Applied as 7.5 material, thanks!
