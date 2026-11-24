Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559124;
	b=Zx48/5HpA/Zhck17Ewxx1CHkX6BijRbZ01AKOlb/5OTJWGP+vOSJ8j4VUHkYQESSaTS/
	 TkfexbGZ5nMG84e1SIr07CSntTMaRnSRE/mA7TH9cc1EmbRkd0avUfMWHQcHrx9G+ynxq
	 NKDrCOByNf0Lqblla7wwmZaGsgCgqCP6y7R1I3GzCawOt6v8cKEkoy/vNpDcNbmLXrOiC
	 Z26Eo9QudxM7RzKoyPfauILo4sStzxMRejJNd9tboL58gLG9KIOOBm5lKUdDPeG7Wu/xx
	 SmX2DpDTUz0AYzWxrBamdQzkke4pW7EQv0fVGT97oFH37jTydAb31eP7E7EbTWqUBIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
	b=eYDPJQFl3n2sCzwrEEBx/PpujZlhq1nRZnw23Z+VuwZheF6TnHXLIKEG8coGONlNnabD
	 O6TlHF/B6obo51dU6Cidcn2uNyCn5wlj7ey4WW1CVYOMW+3ZK41YgTnG1Gx0K2FEcupSc
	 DOKFz/8kD9IXh+GRSHi9Y+gFGlwvdildBMxftDuoeS0Qml2ePIBPgTmoyJb7XaMUMCzuO
	 Wp6xFE32HbhGG3iV93JWeqwlHaKtBPP4ag6YPp7DeLN7/u58oy5BV2ncZOHxmGquUs3lC
	 iqRvkj/dFOpYslQVUx5Wsog4cvNE5A9T8wliAIzECoOeAjZRfSJkl1CqiKaMHln6Txg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N2GWJCzq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD33606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N2GWJCzq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so149355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559121; cv=none;
        d=google.com; s=arc-20260327;
        b=j+e4YQ91m+BEhCyaFhoUy1tNbdIghkUdQ2af8MxAaDQeZUqct70RZnUscrhLrjyLfX
         R/P+S3LLzRMw/vgXGmavYam083WUyp5DkPGioX+rZZXa4FdMLn1pRDCjrE6hlhtO3INg
         1LO6IK2yCJSYPt22Mu8W3EPf15+G1q6bOnuAu1s94m2RWNNlQID2kM27pW+k4HCdisr5
         rXnV8SJn20wjkOFS4XIb378ia4VTQTdga+Mt8H/tkHgwuj+qaX2+AftPNCOV1Y+VPzMt
         /56QNUG1XbrvbFXj11mhKAv1oWfHlJifEUXItsQzDCx5/OpB+KiO+HiqJXqUBgfkYot+
         Urfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        fh=3HZZMCu2WEtyUkDWX9Exdb9GLYBMk6TkZji1ASUE2sk=;
        b=dlWwi+YfzHoi9sogC8RAKShG+VQ7I7xAyrLjOonwOO1bvSehUrI3bmH5Asg7C9e4P6
         xRCjGKzD4mgsp8RN3QYbUvk0SO4uDrTkB4YgnPArfLe2oLE4dqz34tlyy2JC81DlFaAw
         x51WTgn6gY2hmqbhCJZ4RNUPx264nAUKwWRjEzGnBq8DxRr9XWNzbG7zzmAnvpCp7Ed4
         IlssgdgLueJFnWM7AZm/zT6fhGj4ttRs9r2MTPKpABWuyVyrKlv2/p0zy5I8SU9SmYZ6
         MaxBHP+7AZqXrbXwXFtctXBDOTMUqfY35Vgtq5Tw4KwiGiQbn9CcdtSmakwW+yrfoLem
         +MAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559121; x=1796163921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        b=N2GWJCzqiaMrirNLibPnmyf6tjcUM9DrHFWhPhku4m2GcfQHoAucBnUQahQ2yo4eR8
         2MM3NHLDkcinEXO90EAiFuuY7PYg92givKT2uKNItdPgjQ9efrdnbjT1AFRj/tb6WMVn
         nuhuGPFwiZdJvHl1FarzOz36rHIXx2YpNy1kZ03hj8aT45jNliw3WufRm8bmo8vwUG2u
         IPrJiSXumFtsR741KL2k+F8gd5B7mlmmdu0IgwPbFtNUIOVFIyVVU6rvgd4NwuPjRd2Y
         jtgDUssk+cLci7e7rc9KHIkyftGsbxgKCzngYa+XccuyMygdQWyrsmPCf+TtJE78TTN+
         slKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559121; x=1796163921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        b=rjQ5p1dnQ3snQY8A7ZoWhlgL3dQsgJNRcSAOE1eRRtbOWP+xuwW8Nhvw3eJ+Zzxevp
         mbScLcvOdewlqZQouw+PtJuznfG1VClETPE8MDRkOzJvg719OmVlsyuSS95Dg00XXiWe
         C3O4pCFNOm14ugHrE3o1EeEWKJOWILxpgxp/r7YLVXGOMJDstVD36deIjtLnnBUA0MDX
         WHLgfjOq88mp/R3aKnhID6Ql4m269EmZyikxXaYOSL2yY6u+xtIyijVR/vt/qA7FekUd
         ZALeU/8MWrkMc1abRV/kXME2x3Nrs6HNafg4qE5FHJVHzjScSIq953/01AmohOYJ/Oiy
         QfQA==
X-Forwarded-Encrypted: i=1; AL+hErFHeYhBhcP+cuqSE7Cyk/is+NlLTdyCNaxkX4Is8WJAY+Gb+xPRAbDo/LiDtahcGPHFoysNv4/lzc2A3qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BZqXoggejTE/qnOEl8Q/l203n2od9/ns+zvgXf7Y6YnHyXmMA
	J084rUM2YkhT1S/6y+ifsDwSvYuEzY6E9bLVL8KnMW9UshUOUsF9Y+zLrMBfB6OGh+qzd59+0Yu
	QzjqLvFqFjEI3nG40XVanVFTt8TGQnvTXFukOw/N/
X-Gm-Gg: AZFdTZeqIBGinAS5Pj0mz+jU18v0/zzI08D+IUBBNfBZZRz1+ghOU9zy5a+7RuVwyIh
	AjohH+BtFHqYxgWOU93emk/ut9CuJ9U9W93/yvI2e2KNv1eL+evV2C7mXpHLMsbdBD9NY8CklgF
	LuJte0nMqLhQ4eNfTHGLTu1ijzqm2oYD8PXFbKrRf7oS7vKX7sT9qS/r72+fBO6PEEdRJTPoGVE
	cr/2FAdF+Tz8yW52io226BjZ9cKSCXa4laaOYfa3UwnCITe8rnChHAYnGNO4t8qXqhh0kv9L4BX
	z4CK4VKSIj0tTl6MohGQlCeykkKHCKaCFY/fnQUacxPXdoQYUrS2eiZvZdJImC1xznFL47KfuJH
	P/sBn3vPV5cQfoLwhmBkHBAXhvhNPUXtOLacQOhF93lAaSwN2iukqbQQ8L5PxeEGkwEdTVqZfCt
	hElOvidhgwbsv57BSgYNMWpGxyjjdE/ohgSWexkZL9mgU=
X-Received: by 2002:a05:600c:2059:b0:4bb:5a90:8ca4 with SMTP id
 5b1f17b1804b1-4bb9163dd1amr2975305e9.12.1795559120990; Tue, 24 Nov 2026
 14:25:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-3-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-3-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 14:25:09 -0800
X-Gm-Features: Aa3M54pp6bpRCS8AG4iCULQJGiNccxTku4hoCoX4iAQklO5C46N0ugppOSxDFeI
Message-ID: <CABdmKX3EAHhwSWG+kJrNmyMuCF7uY4rdR6=B8hXX=TFaz==4uw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] selftests/udmabuf: test mapping a huge page backed udmabuf
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> udmabuf maps the ranges of a buffer that are backed by huge pages with
> PMDs, provided the mapping covers whole PMDs at an aligned address.
>
> The existing tests of huge page backed buffers only map a few pages, so
> they never get a PMD mapping or check what is read through one.
>
> Map a 64 MiB udmabuf backed by 2 MiB huge pages and read back what was
> written to the memfd, with a different pattern in each huge page: through
> a mapping of the whole buffer, which must be PMD aligned for a 64-bit
> task when THP support is built in, through a mapping at an unaligned
> offset, and from a forked child that inherits the mapping of the whole
> buffer.
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>  tools/testing/selftests/drivers/dma-buf/udmabuf.c | 97 +++++++++++++++++=
+++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/te=
sting/selftests/drivers/dma-buf/udmabuf.c
> index d78aec662586b..6eaef1b3aee01 100644
> --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> @@ -14,6 +14,7 @@
>  #include <sys/ioctl.h>
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
> +#include <sys/wait.h>
>  #include <linux/memfd.h>
>  #include <linux/udmabuf.h>
>  #include "kselftest.h"
> @@ -130,6 +131,98 @@ static int compare_chunks(void *addr1, void *addr2, =
off64_t memfd_size)
>         return ret;
>  }
>
> +#define HPAGE_SIZE     (2UL << 20)

This isn't true on 16k or 64k PAGE_SIZE arm64. Can we read
hpage_pmd_size for the PMD alignment and Hugepagesize: from
/proc/meminfo for the MFD_HUGETLB backing size?

> +#define HUGE_BUF_SIZE  (32 * HPAGE_SIZE)

I think we only really need 8 of these for the sub-range test, and
this gets huge for 16k or 64k base pages.

> +/* Check that @len bytes mapped at @addr match @mem at @off */
> +static bool check_huge_mapping(char *addr, char *mem, off_t off, size_t =
len)
> +{
> +       size_t i;
> +
> +       for (i =3D 0; i < len; i +=3D getpagesize()) {
> +               if (addr[i] !=3D mem[off + i])
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* Check that @len bytes of @buf at @off read back what was written to @=
mem */
> +static bool check_huge_range(int buf, char *mem, off_t off, size_t len)
> +{
> +       char *addr;
> +       bool ok;
> +
> +       addr =3D mmap(NULL, len, PROT_READ, MAP_SHARED, buf, off);
> +       if (addr =3D=3D MAP_FAILED)
> +               return false;
> +
> +       ok =3D check_huge_mapping(addr, mem, off, len);
> +       munmap(addr, len);
> +       return ok;
> +}
> +
> +/*
> + * Map a udmabuf backed by 2MB huge pages, which can be mapped with PMDs=
, and
> + * read it back from a PMD-aligned address, a sub-range at an unaligned =
offset
> + * and a forked child that inherits the mapping.
> + */
> +static void test_huge_mapping(int devfd)
> +{
> +       struct udmabuf_create create =3D {};
> +       int memfd, buf, status;
> +       bool thp, aligned, ok;
> +       char *mem, *addr;
> +       pid_t pid;
> +       size_t i;
> +
> +       memfd =3D create_memfd_with_seals(HUGE_BUF_SIZE, true);
> +       mem =3D mmap_fd(memfd, HUGE_BUF_SIZE);
> +       /* Give each huge page its own pattern */
> +       for (i =3D 0; i < HUGE_BUF_SIZE; i +=3D getpagesize())
> +               mem[i] =3D (char)(i / getpagesize() + i / HPAGE_SIZE);
> +
> +       create.memfd =3D memfd;
> +       create.size =3D HUGE_BUF_SIZE;
> +       buf =3D ioctl(devfd, UDMABUF_CREATE, &create);
> +       if (buf < 0) {
> +               ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX)=
;
> +               ksft_test_result_skip("%s: [SKIP,test-9]\n", TEST_PREFIX)=
;
> +               goto out;
> +       }
> +
> +       /* The address is only aligned for 64-bit tasks with THP support =
*/
> +       thp =3D sizeof(long) =3D=3D 8 &&
> +             !access("/sys/kernel/mm/transparent_hugepage", F_OK);
> +       addr =3D mmap(NULL, HUGE_BUF_SIZE, PROT_READ, MAP_SHARED, buf, 0)=
;
> +       aligned =3D addr !=3D MAP_FAILED &&
> +                 (!thp || !((unsigned long)addr % HPAGE_SIZE));
> +       ok =3D aligned && check_huge_mapping(addr, mem, 0, HUGE_BUF_SIZE)=
;
> +       if (ok)
> +               ksft_test_result_pass("%s: [PASS,test-8]\n", TEST_PREFIX)=
;
> +       else
> +               ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX)=
;
> +
> +       ok =3D check_huge_range(buf, mem, HPAGE_SIZE + getpagesize(),
> +                             5 * HPAGE_SIZE + 3 * getpagesize());

We should probably also have a test with create.offset =3D getpagesize()
to exercise the misaligned PFN fallback.

Also a test that faults a PMD, then disables THP and then faults
elsewhere to cover the v1 bug.
